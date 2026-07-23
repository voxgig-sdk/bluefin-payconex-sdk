#!perl
# AccountUpdaterScheduleWithResult direct test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinPayconexSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

DIRECT_LIST: {
  my $setup = account_updater_schedule_with_result_direct_setup([
    { 'id' => 'direct01' },
    { 'id' => 'direct02' },
  ]);
  my ($_should_skip, $_reason) = BluefinPayconexTestRunner::is_control_skipped(
    'direct', 'direct-list-account_updater_schedule_with_result', $setup->{live} ? 'live' : 'unit');
  if ($_should_skip) {
    note($_reason || 'skipped via sdk-test-control.json');
    pass('direct-list-account_updater_schedule_with_result: skipped via sdk-test-control.json');
    last DIRECT_LIST;
  }
  if ($setup->{live}) {
    for my $_live_key ('account01', 'schedule01') {
      if (!defined $setup->{idmap}{$_live_key}) {
        note("live test needs $_live_key via *_ENTID env var (synthetic IDs only)");
        pass('direct-list-account_updater_schedule_with_result: skipped');
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
  if ($setup->{live}) {
    $params->{'schedule_id'} = $setup->{idmap}{'schedule01'};
  }
  else {
    $params->{'schedule_id'} = 'direct01';
  }

  my $result = $client->direct({
    'path' => 'api/v4/accounts/{account_id}/account-updater/schedules/{schedule_id}/results',
    'method' => 'GET',
    'params' => $params,
  });
  if ($setup->{live}) {
    # Live mode is lenient: synthetic IDs frequently 4xx and the list-
    # response shape varies wildly across public APIs. Skip rather than
    # fail when the call doesn't return a usable list.
    if (defined $result->{err}) {
      note("list call failed (likely synthetic IDs against live API): $result->{err}");
      pass('direct-list-account_updater_schedule_with_result: skipped (live)');
      last DIRECT_LIST;
    }
    unless ($result->{ok}) {
      note('list call not ok (likely synthetic IDs against live API)');
      pass('direct-list-account_updater_schedule_with_result: skipped (live)');
      last DIRECT_LIST;
    }
    my $status = BluefinPayconexHelpers::to_int($result->{status});
    if ($status < 200 || $status >= 300) {
      note("expected 2xx status, got $status");
      pass('direct-list-account_updater_schedule_with_result: skipped (live)');
      last DIRECT_LIST;
    }
    pass('direct-list-account_updater_schedule_with_result: live ok');
  }
  else {
    ok(!defined $result->{err}, 'direct-list-account_updater_schedule_with_result: no error');
    ok($result->{ok}, 'direct-list-account_updater_schedule_with_result: ok');
    is(BluefinPayconexHelpers::to_int($result->{status}), 200, 'direct-list-account_updater_schedule_with_result: status');
    ok(Voxgig::Struct::islist($result->{data}), 'direct-list-account_updater_schedule_with_result: data is array');
    is(scalar @{ $result->{data} }, 2, 'direct-list-account_updater_schedule_with_result: data length');
    is(scalar @{ $setup->{calls} }, 1, 'direct-list-account_updater_schedule_with_result: 1 call');
  }
}


sub account_updater_schedule_with_result_direct_setup {
  my ($mockres) = @_;
  BluefinPayconexTestRunner::load_env_local();

  my $calls = [];

  my $env = BluefinPayconexTestRunner::env_override({
    'BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID' => {},
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
