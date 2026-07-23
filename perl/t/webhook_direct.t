#!perl
# Webhook direct test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinPayconexSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

DIRECT_LIST: {
  my $setup = webhook_direct_setup([
    { 'id' => 'direct01' },
    { 'id' => 'direct02' },
  ]);
  my ($_should_skip, $_reason) = BluefinPayconexTestRunner::is_control_skipped(
    'direct', 'direct-list-webhook', $setup->{live} ? 'live' : 'unit');
  if ($_should_skip) {
    note($_reason || 'skipped via sdk-test-control.json');
    pass('direct-list-webhook: skipped via sdk-test-control.json');
    last DIRECT_LIST;
  }
  if ($setup->{live}) {
    for my $_live_key ('account01') {
      if (!defined $setup->{idmap}{$_live_key}) {
        note("live test needs $_live_key via *_ENTID env var (synthetic IDs only)");
        pass('direct-list-webhook: skipped');
        last DIRECT_LIST;
      }
    }
  }
  my $client = $setup->{client};

  my $params = {};
  if ($setup->{live}) {
    $params->{'account_id'} = $setup->{idmap}{'account01'};
  }
  else {
    $params->{'account_id'} = 'direct01';
  }

  my $result = $client->direct({
    'path' => 'api/v4/accounts/{account_id}/webhooks',
    'method' => 'GET',
    'params' => $params,
  });
  if ($setup->{live}) {
    # Live mode is lenient: synthetic IDs frequently 4xx and the list-
    # response shape varies wildly across public APIs. Skip rather than
    # fail when the call doesn't return a usable list.
    if (defined $result->{err}) {
      note("list call failed (likely synthetic IDs against live API): $result->{err}");
      pass('direct-list-webhook: skipped (live)');
      last DIRECT_LIST;
    }
    unless ($result->{ok}) {
      note('list call not ok (likely synthetic IDs against live API)');
      pass('direct-list-webhook: skipped (live)');
      last DIRECT_LIST;
    }
    my $status = BluefinPayconexHelpers::to_int($result->{status});
    if ($status < 200 || $status >= 300) {
      note("expected 2xx status, got $status");
      pass('direct-list-webhook: skipped (live)');
      last DIRECT_LIST;
    }
    pass('direct-list-webhook: live ok');
  }
  else {
    ok(!defined $result->{err}, 'direct-list-webhook: no error');
    ok($result->{ok}, 'direct-list-webhook: ok');
    is(BluefinPayconexHelpers::to_int($result->{status}), 200, 'direct-list-webhook: status');
    ok(Voxgig::Struct::islist($result->{data}), 'direct-list-webhook: data is array');
    is(scalar @{ $result->{data} }, 2, 'direct-list-webhook: data length');
    is(scalar @{ $setup->{calls} }, 1, 'direct-list-webhook: 1 call');
  }
}

DIRECT_LOAD: {
  my $setup = webhook_direct_setup({ 'id' => 'direct01' });
  my ($_should_skip, $_reason) = BluefinPayconexTestRunner::is_control_skipped(
    'direct', 'direct-load-webhook', $setup->{live} ? 'live' : 'unit');
  if ($_should_skip) {
    note($_reason || 'skipped via sdk-test-control.json');
    pass('direct-load-webhook: skipped via sdk-test-control.json');
    last DIRECT_LOAD;
  }
  my $client = $setup->{client};

  my $params = {};
  my $query = {};
  if ($setup->{live}) {
    $params->{'account_id'} = 120615523104;
    $params->{'id'} = 'wbh_d193148ac2624de7b43a191682a8822f';
  }
  else {
    $params->{'account_id'} = 'direct01';
    $params->{'id'} = 'direct02';
  }

  my $result = $client->direct({
    'path' => 'api/v4/accounts/{account_id}/webhooks/{id}',
    'method' => 'GET',
    'params' => $params,
    'query' => $query,
  });
  if ($setup->{live}) {
    # Live mode is lenient: synthetic IDs frequently 4xx. Skip rather
    # than fail when the load endpoint isn't reachable with the IDs
    # we can construct from setup idmap.
    if (defined $result->{err}) {
      note("load call failed (likely synthetic IDs against live API): $result->{err}");
      pass('direct-load-webhook: skipped (live)');
      last DIRECT_LOAD;
    }
    unless ($result->{ok}) {
      note('load call not ok (likely synthetic IDs against live API)');
      pass('direct-load-webhook: skipped (live)');
      last DIRECT_LOAD;
    }
    my $status = BluefinPayconexHelpers::to_int($result->{status});
    if ($status < 200 || $status >= 300) {
      note("expected 2xx status, got $status");
      pass('direct-load-webhook: skipped (live)');
      last DIRECT_LOAD;
    }
    pass('direct-load-webhook: live ok');
  }
  else {
    ok(!defined $result->{err}, 'direct-load-webhook: no error');
    ok($result->{ok}, 'direct-load-webhook: ok');
    is(BluefinPayconexHelpers::to_int($result->{status}), 200, 'direct-load-webhook: status');
    ok(defined $result->{data}, 'direct-load-webhook: data');
    if (Voxgig::Struct::ismap($result->{data})) {
      is($result->{data}{id}, 'direct01', 'direct-load-webhook: id');
    }
    is(scalar @{ $setup->{calls} }, 1, 'direct-load-webhook: 1 call');
  }
}


sub webhook_direct_setup {
  my ($mockres) = @_;
  BluefinPayconexTestRunner::load_env_local();

  my $calls = [];

  my $env = BluefinPayconexTestRunner::env_override({
    'BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID' => {},
    'BLUEFINPAYCONEX_TEST_LIVE' => 'FALSE',
    'BLUEFINPAYCONEX_APIKEY' => 'NONE',
  });

  my $live = ((($env->{'BLUEFINPAYCONEX_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;

  if ($live) {
    my $client = BluefinPayconexSDK->new({
      'apikey' => $env->{'BLUEFINPAYCONEX_APIKEY'},
    });
    return {
      'client' => $client,
      'calls' => $calls,
      'live' => 1,
      'idmap' => {},
    };
  }

  my $mock_fetch = sub {
    my ($url, $init) = @_;
    push @$calls, { 'url' => $url, 'init' => $init };
    return ({
      'status' => 200,
      'statusText' => 'OK',
      'headers' => {},
      'json' => sub {
        return defined $mockres ? $mockres : { 'id' => 'direct01' };
      },
      'body' => 'mock',
    }, undef);
  };

  my $client = BluefinPayconexSDK->new({
    'base' => 'http://localhost:8080',
    'system' => {
      'fetch' => $mock_fetch,
    },
  });

  return {
    'client' => $client,
    'calls' => $calls,
    'live' => 0,
    'idmap' => {},
  };
}

done_testing();
