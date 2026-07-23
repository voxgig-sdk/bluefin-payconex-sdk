# BluefinPayconex SDK

use strict;
use warnings;

use File::Basename ();
use Cwd ();
use Scalar::Util ();

package BluefinPayconexSDK;

our $VERSION = '0.0.1';

our $DIR;
BEGIN { $DIR = File::Basename::dirname(Cwd::abs_path(__FILE__)) }

require(Cwd::abs_path("$DIR/Voxgig/Struct.pm"));
require(Cwd::abs_path("$DIR/../core/helpers.pm"));
require(Cwd::abs_path("$DIR/../core/utility_type.pm"));
require(Cwd::abs_path("$DIR/../core/spec.pm"));
require(Cwd::abs_path("$DIR/../core/error.pm"));

# Load utility registration
require(Cwd::abs_path("$DIR/../utility/register.pm"));

# Load config and features
require(Cwd::abs_path("$DIR/../config.pm"));
require(Cwd::abs_path("$DIR/../feature/base_feature.pm"));
require(Cwd::abs_path("$DIR/../features.pm"));

sub new {
  my ($class, $options) = @_;
  $options = {} unless defined $options;

  my $self = bless {
    mode => 'live',
    features => [],
    options => undef,
  }, $class;

  my $utility = BluefinPayconexUtility->new;
  $self->{_utility} = $utility;

  my $config = BluefinPayconexConfig::make_config();

  $self->{_rootctx} = $utility->{make_context}->({
    'client' => $self,
    'utility' => $utility,
    'config' => $config,
    'options' => $options,
    'shared' => {},
  }, undef);

  $self->{options} = $utility->{make_options}->($self->{_rootctx});

  if (BluefinPayconexHelpers::is_true(
    BluefinPayconexHelpers::gpath($self->{options}, 'feature.test.active'))) {
    $self->{mode} = 'test';
  }

  $self->{_rootctx}{options} = $self->{options};

  # Add features in the resolved order (make_options records an explicit
  # array order, else defaults to test-first). Ordering matters: the `test`
  # feature installs the base mock transport and the transport features
  # (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
  # must be added before them to sit at the base of the wrapper chain.
  my $feature_opts = BluefinPayconexHelpers::to_map(
    BluefinPayconexHelpers::gp($self->{options}, 'feature')) || {};
  my $featureorder = BluefinPayconexHelpers::gpath(
    $self->{options}, '__derived__.featureorder');
  $featureorder = [] unless Voxgig::Struct::islist($featureorder);
  for my $fname (@$featureorder) {
    my $fopts = BluefinPayconexHelpers::to_map($feature_opts->{$fname});
    if ($fopts && BluefinPayconexHelpers::is_true($fopts->{active})) {
      $utility->{feature_add}->($self->{_rootctx},
        BluefinPayconexFeatures::make_feature($fname));
    }
  }

  # Add extension features.
  my $extend = BluefinPayconexHelpers::gp($self->{options}, 'extend');
  if (Voxgig::Struct::islist($extend)) {
    for my $f (@$extend) {
      if (Scalar::Util::blessed($f) && $f->can('get_name')) {
        $utility->{feature_add}->($self->{_rootctx}, $f);
      }
    }
  }

  # Initialize features.
  for my $f (@{ $self->{features} }) {
    $utility->{feature_init}->($self->{_rootctx}, $f);
  }

  $utility->{feature_hook}->($self->{_rootctx}, 'PostConstruct');

  return $self;
}

sub options_map {
  my ($self) = @_;
  my $out = Voxgig::Struct::clone($self->{options});
  return Voxgig::Struct::ismap($out) ? $out : {};
}

sub get_utility {
  my ($self) = @_;
  return BluefinPayconexUtility->copy($self->{_utility});
}

sub get_root_ctx {
  my ($self) = @_;
  return $self->{_rootctx};
}

sub prepare {
  my ($self, $fetchargs) = @_;
  my $utility = $self->{_utility};
  $fetchargs = {} unless defined $fetchargs;

  my $ctrl = BluefinPayconexHelpers::to_map(
    BluefinPayconexHelpers::gp($fetchargs, 'ctrl')) || {};

  my $ctx = $utility->{make_context}->({
    'opname' => 'prepare',
    'ctrl' => $ctrl,
  }, $self->{_rootctx});

  my $opts = $self->{options};
  my $path = BluefinPayconexHelpers::gp($fetchargs, 'path');
  $path = '' unless defined $path && !ref $path;
  my $method_val = BluefinPayconexHelpers::gp($fetchargs, 'method');
  $method_val = 'GET' unless defined $method_val && !ref $method_val;
  my $params = BluefinPayconexHelpers::to_map(
    BluefinPayconexHelpers::gp($fetchargs, 'params')) || {};
  my $query = BluefinPayconexHelpers::to_map(
    BluefinPayconexHelpers::gp($fetchargs, 'query')) || {};
  my $headers = $utility->{prepare_headers}->($ctx);

  my $base = BluefinPayconexHelpers::gp($opts, 'base');
  $base = '' unless defined $base && !ref $base;
  my $prefix = BluefinPayconexHelpers::gp($opts, 'prefix');
  $prefix = '' unless defined $prefix && !ref $prefix;
  my $suffix = BluefinPayconexHelpers::gp($opts, 'suffix');
  $suffix = '' unless defined $suffix && !ref $suffix;

  $ctx->{spec} = BluefinPayconexSpec->new({
    'base' => $base, 'prefix' => $prefix, 'suffix' => $suffix,
    'path' => $path, 'method' => $method_val,
    'params' => $params, 'query' => $query, 'headers' => $headers,
    'body' => BluefinPayconexHelpers::gp($fetchargs, 'body'),
    'step' => 'start',
  });

  # Merge user-provided headers.
  my $uh = BluefinPayconexHelpers::gp($fetchargs, 'headers');
  if (Voxgig::Struct::ismap($uh)) {
    $ctx->{spec}{headers}{$_} = $uh->{$_} for keys %$uh;
  }

  my (undef, $err) = $utility->{prepare_auth}->($ctx);
  die $err if $err;

  # make_fetch_def returns a (fetchdef, err) tuple; destructure it and
  # return just the fetchdef hashref (dying on error) so callers -
  # including direct(), which indexes fetchdef->{url} - receive a hashref,
  # mirroring the ts/py/rb prepare().
  my ($fetchdef, $fd_err) = $utility->{make_fetch_def}->($ctx);
  die $fd_err if $fd_err;

  return $fetchdef;
}

sub direct {
  my ($self, $fetchargs) = @_;
  my $utility = $self->{_utility};

  # direct() is the raw-HTTP escape hatch: it always returns a result hash
  # ({ ok => ..., ... }) and never dies. prepare() dies on error, so trap
  # that and surface it in the hash.
  my $fetchdef = eval { $self->prepare($fetchargs) };
  if (my $prep_err = $@) {
    return { 'ok' => 0, 'err' => $prep_err };
  }

  $fetchargs = {} unless defined $fetchargs;
  my $ctrl = BluefinPayconexHelpers::to_map(
    BluefinPayconexHelpers::gp($fetchargs, 'ctrl')) || {};

  my $ctx = $utility->{make_context}->({
    'opname' => 'direct',
    'ctrl' => $ctrl,
  }, $self->{_rootctx});

  my $url = defined $fetchdef->{url} ? $fetchdef->{url} : '';
  my ($fetched, $fetch_err) = $utility->{fetcher}->($ctx, $url, $fetchdef);

  return { 'ok' => 0, 'err' => $fetch_err } if $fetch_err;

  if (!defined $fetched) {
    return {
      'ok' => 0,
      'err' => $ctx->make_error('direct_no_response', 'response: undefined'),
    };
  }

  if (Voxgig::Struct::ismap($fetched)) {
    my $status = BluefinPayconexHelpers::to_int(
      BluefinPayconexHelpers::gp($fetched, 'status'));
    my $headers = BluefinPayconexHelpers::gp($fetched, 'headers') || {};

    # No-body responses (204, 304) and explicit zero content-length must
    # skip JSON parsing - calling json() on an empty body errors.
    my $content_length = Voxgig::Struct::ismap($headers)
      ? $headers->{'content-length'} : undef;
    my $no_body = (204 == $status || 304 == $status
      || (defined $content_length && '0' eq "$content_length")) ? 1 : 0;

    my $json_data;
    unless ($no_body) {
      my $jf = BluefinPayconexHelpers::gp($fetched, 'json');
      if (ref $jf eq 'CODE') {
        # Non-JSON body - leave data undef, keep status/headers.
        $json_data = eval { $jf->() };
      }
    }

    return {
      'ok' => ($status >= 200 && $status < 300) ? 1 : 0,
      'status' => $status,
      'headers' => $headers,
      'data' => $json_data,
    };
  }

  return {
    'ok' => 0,
    'err' => $ctx->make_error('direct_invalid', 'invalid response type'),
  };
}


# Canonical facade: $client->AccountUpdater->list / ->load({ 'id' => ... })
sub AccountUpdater {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/account_updater_entity.pm"));
  return AccountUpdaterEntity->new($self, $data);
}


# Canonical facade: $client->AccountUpdaterSchedule->list / ->load({ 'id' => ... })
sub AccountUpdaterSchedule {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/account_updater_schedule_entity.pm"));
  return AccountUpdaterScheduleEntity->new($self, $data);
}


# Canonical facade: $client->AccountUpdaterScheduleWithResult->list / ->load({ 'id' => ... })
sub AccountUpdaterScheduleWithResult {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/account_updater_schedule_with_result_entity.pm"));
  return AccountUpdaterScheduleWithResultEntity->new($self, $data);
}


# Canonical facade: $client->AccountUpdaterSubscriptionWithResult->list / ->load({ 'id' => ... })
sub AccountUpdaterSubscriptionWithResult {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/account_updater_subscription_with_result_entity.pm"));
  return AccountUpdaterSubscriptionWithResultEntity->new($self, $data);
}


# Canonical facade: $client->AccountUpdaterUpdate->list / ->load({ 'id' => ... })
sub AccountUpdaterUpdate {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/account_updater_update_entity.pm"));
  return AccountUpdaterUpdateEntity->new($self, $data);
}


# Canonical facade: $client->ApiKey->list / ->load({ 'id' => ... })
sub ApiKey {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/api_key_entity.pm"));
  return ApiKeyEntity->new($self, $data);
}


# Canonical facade: $client->ApplePayMerchantDetail->list / ->load({ 'id' => ... })
sub ApplePayMerchantDetail {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/apple_pay_merchant_detail_entity.pm"));
  return ApplePayMerchantDetailEntity->new($self, $data);
}


# Canonical facade: $client->ApplePaySession->list / ->load({ 'id' => ... })
sub ApplePaySession {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/apple_pay_session_entity.pm"));
  return ApplePaySessionEntity->new($self, $data);
}


# Canonical facade: $client->DynamicDescriptor->list / ->load({ 'id' => ... })
sub DynamicDescriptor {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/dynamic_descriptor_entity.pm"));
  return DynamicDescriptorEntity->new($self, $data);
}


# Canonical facade: $client->IFrameCreateInstance->list / ->load({ 'id' => ... })
sub IFrameCreateInstance {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/i_frame_create_instance_entity.pm"));
  return IFrameCreateInstanceEntity->new($self, $data);
}


# Canonical facade: $client->IFrameInstance->list / ->load({ 'id' => ... })
sub IFrameInstance {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/i_frame_instance_entity.pm"));
  return IFrameInstanceEntity->new($self, $data);
}


# Canonical facade: $client->Iframe->list / ->load({ 'id' => ... })
sub Iframe {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/iframe_entity.pm"));
  return IframeEntity->new($self, $data);
}


# Canonical facade: $client->Init->list / ->load({ 'id' => ... })
sub Init {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/init_entity.pm"));
  return InitEntity->new($self, $data);
}


# Canonical facade: $client->ListApiKeyScopesEntry->list / ->load({ 'id' => ... })
sub ListApiKeyScopesEntry {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/list_api_key_scopes_entry_entity.pm"));
  return ListApiKeyScopesEntryEntity->new($self, $data);
}


# Canonical facade: $client->PaymentIframe->list / ->load({ 'id' => ... })
sub PaymentIframe {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/payment_iframe_entity.pm"));
  return PaymentIframeEntity->new($self, $data);
}


# Canonical facade: $client->ThreeDSecureAuth->list / ->load({ 'id' => ... })
sub ThreeDSecureAuth {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/three_d_secure_auth_entity.pm"));
  return ThreeDSecureAuthEntity->new($self, $data);
}


# Canonical facade: $client->ThreeDSecureBrowserInit->list / ->load({ 'id' => ... })
sub ThreeDSecureBrowserInit {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/three_d_secure_browser_init_entity.pm"));
  return ThreeDSecureBrowserInitEntity->new($self, $data);
}


# Canonical facade: $client->ThreeDSecureStatus->list / ->load({ 'id' => ... })
sub ThreeDSecureStatus {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/three_d_secure_status_entity.pm"));
  return ThreeDSecureStatusEntity->new($self, $data);
}


# Canonical facade: $client->TransactionDetail->list / ->load({ 'id' => ... })
sub TransactionDetail {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/transaction_detail_entity.pm"));
  return TransactionDetailEntity->new($self, $data);
}


# Canonical facade: $client->Webhook->list / ->load({ 'id' => ... })
sub Webhook {
  my ($self, $data) = @_;
  require(Cwd::abs_path("$DIR/../entity/webhook_entity.pm"));
  return WebhookEntity->new($self, $data);
}



sub test {
  my ($class, $testopts, $sdkopts) = @_;
  $sdkopts = {} unless defined $sdkopts;
  $sdkopts = Voxgig::Struct::clone($sdkopts);
  $sdkopts = {} unless Voxgig::Struct::ismap($sdkopts);

  $testopts = {} unless defined $testopts;
  $testopts = Voxgig::Struct::clone($testopts);
  $testopts = {} unless Voxgig::Struct::ismap($testopts);
  $testopts->{active} = Voxgig::Struct::JTRUE();

  Voxgig::Struct::setpath($sdkopts, 'feature.test', $testopts);

  my $sdk = $class->new($sdkopts);
  $sdk->{mode} = 'test';
  return $sdk;
}

1;
