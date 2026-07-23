#!perl
# AccountUpdaterSubscriptionWithResult entity test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinPayconexSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

{
  my $testsdk = BluefinPayconexSDK->test(undef, undef);
  my $ent = $testsdk->AccountUpdaterSubscriptionWithResult(undef);
  ok(defined $ent, 'account_updater_subscription_with_result: create instance');
}

BASIC_FLOW: {
  my $setup = account_updater_subscription_with_result_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op ('create', 'update', 'load') {
    my ($_should_skip, $_reason) = BluefinPayconexTestRunner::is_control_skipped(
      'entityOp', "account_updater_subscription_with_result." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('account_updater_subscription_with_result: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  # The basic flow consumes synthetic IDs from the fixture. In live mode
  # without an *_ENTID env override, those IDs hit the live API and 4xx.
  if ($setup->{synthetic_only}) {
    note('live entity test uses synthetic IDs from fixture - set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID JSON to run live');
    pass('account_updater_subscription_with_result: basic flow skipped (synthetic IDs only)');
    last BASIC_FLOW;
  }
  my $client = $setup->{client};
  my %V;

  # CREATE
  $V{account_updater_subscription_with_result_ref01_ent} = $client->AccountUpdaterSubscriptionWithResult(undef);
  $V{account_updater_subscription_with_result_ref01_data} = BluefinPayconexHelpers::to_map(BluefinPayconexHelpers::gp(
    BluefinPayconexHelpers::gpath($setup->{data}, 'new.account_updater_subscription_with_result'), 'account_updater_subscription_with_result_ref01'));
  $V{account_updater_subscription_with_result_ref01_data}{'account_id'} = $setup->{idmap}{'account01'};
  $V{account_updater_subscription_with_result_ref01_data}{'subscription_id'} = $setup->{idmap}{'subscription01'};

  $V{account_updater_subscription_with_result_ref01_data_result} = $V{account_updater_subscription_with_result_ref01_ent}->create($V{account_updater_subscription_with_result_ref01_data}, undef);
  $V{account_updater_subscription_with_result_ref01_data} = BluefinPayconexHelpers::to_map($V{account_updater_subscription_with_result_ref01_data_result});
  ok(defined $V{account_updater_subscription_with_result_ref01_data}, 'account_updater_subscription_with_result create: data');
  ok(defined $V{account_updater_subscription_with_result_ref01_data}{id}, 'account_updater_subscription_with_result create: id');

  # UPDATE
  $V{account_updater_subscription_with_result_ref01_data_up0_up} = {
    'id' => $V{account_updater_subscription_with_result_ref01_data}{id},
    'account_id' => $setup->{idmap}{'account_id'},
  };

  $V{account_updater_subscription_with_result_ref01_markdef_up0_name} = 'created_at';
  $V{account_updater_subscription_with_result_ref01_markdef_up0_value} = 'Mark01-account_updater_subscription_with_result_ref01_' . $setup->{now};
  $V{account_updater_subscription_with_result_ref01_data_up0_up}{ $V{account_updater_subscription_with_result_ref01_markdef_up0_name} } = $V{account_updater_subscription_with_result_ref01_markdef_up0_value};

  $V{account_updater_subscription_with_result_ref01_resdata_up0_result} = $V{account_updater_subscription_with_result_ref01_ent}->update($V{account_updater_subscription_with_result_ref01_data_up0_up}, undef);
  $V{account_updater_subscription_with_result_ref01_resdata_up0} = BluefinPayconexHelpers::to_map($V{account_updater_subscription_with_result_ref01_resdata_up0_result});
  ok(defined $V{account_updater_subscription_with_result_ref01_resdata_up0}, 'account_updater_subscription_with_result update: data');
  is($V{account_updater_subscription_with_result_ref01_resdata_up0}{id}, $V{account_updater_subscription_with_result_ref01_data_up0_up}{id}, 'account_updater_subscription_with_result update: id');
  is($V{account_updater_subscription_with_result_ref01_resdata_up0}{ $V{account_updater_subscription_with_result_ref01_markdef_up0_name} }, $V{account_updater_subscription_with_result_ref01_markdef_up0_value}, 'account_updater_subscription_with_result update: mark');

  # LOAD
  $V{account_updater_subscription_with_result_ref01_match_dt0} = {
    'id' => $V{account_updater_subscription_with_result_ref01_data}{id},
  };
  $V{account_updater_subscription_with_result_ref01_data_dt0_loaded} = $V{account_updater_subscription_with_result_ref01_ent}->load($V{account_updater_subscription_with_result_ref01_match_dt0}, undef);
  $V{account_updater_subscription_with_result_ref01_data_dt0_load_result} = BluefinPayconexHelpers::to_map($V{account_updater_subscription_with_result_ref01_data_dt0_loaded});
  ok(defined $V{account_updater_subscription_with_result_ref01_data_dt0_load_result}, 'account_updater_subscription_with_result load: data');
  is($V{account_updater_subscription_with_result_ref01_data_dt0_load_result}{id}, $V{account_updater_subscription_with_result_ref01_data}{id}, 'account_updater_subscription_with_result load: id');

}

sub account_updater_subscription_with_result_basic_setup {
  my ($extra) = @_;
  BluefinPayconexTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/account_updater_subscription_with_result/AccountUpdaterSubscriptionWithResultTestData.json");
  my $entity_data = do {
    open my $fh, '<:raw', $entity_data_file or die "Cannot open $entity_data_file: $!";
    local $/;
    Voxgig::Struct::parse_json(<$fh>);
  };

  my $options = {};
  $options->{entity} = $entity_data->{existing};

  my $client = BluefinPayconexSDK->test($options, $extra);

  # Generate idmap via transform.
  my $idmap = Voxgig::Struct::transform(
    ['account_updater_subscription_with_result01', 'account_updater_subscription_with_result02', 'account_updater_subscription_with_result03', 'account01', 'account02', 'account03', 'subscription01', 'subscription02', 'subscription03'],
    {
      '`$PACK`' => ['', {
        '`$KEY`' => '`$COPY`',
        '`$VAL`' => ['`$FORMAT`', 'upper', '`$COPY`'],
      }],
    }
  );

  # Detect ENTID env override before env_override consumes it. When live
  # mode is on without a real override, the basic test runs against
  # synthetic IDs from the fixture and 4xx's. Surface this so the test can
  # skip.
  my $entid_env_raw = $ENV{'BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinPayconexTestRunner::env_override({
    'BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID' => $idmap,
    'BLUEFINPAYCONEX_TEST_LIVE' => 'FALSE',
    'BLUEFINPAYCONEX_TEST_EXPLAIN' => 'FALSE',
    'BLUEFINPAYCONEX_APIKEY' => 'NONE',
  });

  my $idmap_resolved = BluefinPayconexHelpers::to_map($env->{'BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID'});
  if (!defined $idmap_resolved) {
    $idmap_resolved = BluefinPayconexHelpers::to_map($idmap);
  }
  if (!defined $idmap_resolved->{'account_id'}) {
    $idmap_resolved->{'account_id'} = $idmap_resolved->{'account01'};
  }

  if ((($env->{'BLUEFINPAYCONEX_TEST_LIVE'}) || '') eq 'TRUE') {
    my $merged_opts = Voxgig::Struct::merge([
      {
        'apikey' => $env->{'BLUEFINPAYCONEX_APIKEY'},
      },
      (Voxgig::Struct::ismap($extra) ? $extra : {}),
    ]);
    $client = BluefinPayconexSDK->new(BluefinPayconexHelpers::to_map($merged_opts));
  }

  my $live = ((($env->{'BLUEFINPAYCONEX_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;
  return {
    'client' => $client,
    'data' => $entity_data,
    'idmap' => $idmap_resolved,
    'env' => $env,
    'explain' => ((($env->{'BLUEFINPAYCONEX_TEST_EXPLAIN'}) || '') eq 'TRUE') ? 1 : 0,
    'live' => $live,
    'synthetic_only' => ($live && !$idmap_overridden) ? 1 : 0,
    'now' => BluefinPayconexHelpers::now_ms(),
  };
}

done_testing();
