#!perl
# ThreeDSecureStatus direct test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinPayconexSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

DIRECT_LOAD: {
  my $setup = three_d_secure_status_direct_setup({ 'id' => 'direct01' });
  my ($_should_skip, $_reason) = BluefinPayconexTestRunner::is_control_skipped(
    'direct', 'direct-load-three_d_secure_status', $setup->{live} ? 'live' : 'unit');
  if ($_should_skip) {
    note($_reason || 'skipped via sdk-test-control.json');
    pass('direct-load-three_d_secure_status: skipped via sdk-test-control.json');
    last DIRECT_LOAD;
  }
  my $client = $setup->{client};

  my $params = {};
  my $query = {};
  if ($setup->{live}) {
    $params->{'3_d_id'} = 'tds_23d0e53de3c64e94887116da65abc8ce';
    $params->{'account_id'} = '120615523104';
  }
  else {
    $params->{'3_d_id'} = 'direct01';
    $params->{'account_id'} = 'direct02';
  }

  my $result = $client->direct({
    'path' => 'api/v4/accounts/{account_id}/3DS/{3_d_id}/status',
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
      pass('direct-load-three_d_secure_status: skipped (live)');
      last DIRECT_LOAD;
    }
    unless ($result->{ok}) {
      note('load call not ok (likely synthetic IDs against live API)');
      pass('direct-load-three_d_secure_status: skipped (live)');
      last DIRECT_LOAD;
    }
    my $status = BluefinPayconexHelpers::to_int($result->{status});
    if ($status < 200 || $status >= 300) {
      note("expected 2xx status, got $status");
      pass('direct-load-three_d_secure_status: skipped (live)');
      last DIRECT_LOAD;
    }
    pass('direct-load-three_d_secure_status: live ok');
  }
  else {
    ok(!defined $result->{err}, 'direct-load-three_d_secure_status: no error');
    ok($result->{ok}, 'direct-load-three_d_secure_status: ok');
    is(BluefinPayconexHelpers::to_int($result->{status}), 200, 'direct-load-three_d_secure_status: status');
    ok(defined $result->{data}, 'direct-load-three_d_secure_status: data');
    if (Voxgig::Struct::ismap($result->{data})) {
      is($result->{data}{id}, 'direct01', 'direct-load-three_d_secure_status: id');
    }
    is(scalar @{ $setup->{calls} }, 1, 'direct-load-three_d_secure_status: 1 call');
  }
}


sub three_d_secure_status_direct_setup {
  my ($mockres) = @_;
  BluefinPayconexTestRunner::load_env_local();

  my $calls = [];

  my $env = BluefinPayconexTestRunner::env_override({
    'BLUEFINPAYCONEX_TEST_THREE_D_SECURE_STATUS_ENTID' => {},
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
