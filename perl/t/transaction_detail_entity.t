#!perl
# TransactionDetail entity test

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
  my $ent = $testsdk->TransactionDetail(undef);
  ok(defined $ent, 'transaction_detail: create instance');
}

BASIC_FLOW: {
  my $setup = transaction_detail_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op ('update', 'load') {
    my ($_should_skip, $_reason) = BluefinPayconexTestRunner::is_control_skipped(
      'entityOp', "transaction_detail." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('transaction_detail: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  # The basic flow consumes synthetic IDs from the fixture. In live mode
  # without an *_ENTID env override, those IDs hit the live API and 4xx.
  if ($setup->{synthetic_only}) {
    note('live entity test uses synthetic IDs from fixture - set BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID JSON to run live');
    pass('transaction_detail: basic flow skipped (synthetic IDs only)');
    last BASIC_FLOW;
  }
  my $client = $setup->{client};
  my %V;

  # Bootstrap entity data from existing test data.
  $V{transaction_detail_ref01_data_raw} = Voxgig::Struct::items(BluefinPayconexHelpers::to_map(
    BluefinPayconexHelpers::gpath($setup->{data}, 'existing.transaction_detail')));
  $V{transaction_detail_ref01_data} = undef;
  if (@{ $V{transaction_detail_ref01_data_raw} || [] }) {
    $V{transaction_detail_ref01_data} = BluefinPayconexHelpers::to_map($V{transaction_detail_ref01_data_raw}[0][1]);
  }

  # UPDATE
  $V{transaction_detail_ref01_ent} = $client->TransactionDetail(undef);
  $V{transaction_detail_ref01_data_up0_up} = {
    'id' => $V{transaction_detail_ref01_data}{id},
    'account_id' => $setup->{idmap}{'account_id'},
  };

  $V{transaction_detail_ref01_markdef_up0_name} = 'description';
  $V{transaction_detail_ref01_markdef_up0_value} = 'Mark01-transaction_detail_ref01_' . $setup->{now};
  $V{transaction_detail_ref01_data_up0_up}{ $V{transaction_detail_ref01_markdef_up0_name} } = $V{transaction_detail_ref01_markdef_up0_value};

  $V{transaction_detail_ref01_resdata_up0_result} = $V{transaction_detail_ref01_ent}->update($V{transaction_detail_ref01_data_up0_up}, undef);
  $V{transaction_detail_ref01_resdata_up0} = BluefinPayconexHelpers::to_map($V{transaction_detail_ref01_resdata_up0_result});
  ok(defined $V{transaction_detail_ref01_resdata_up0}, 'transaction_detail update: data');
  is($V{transaction_detail_ref01_resdata_up0}{id}, $V{transaction_detail_ref01_data_up0_up}{id}, 'transaction_detail update: id');
  is($V{transaction_detail_ref01_resdata_up0}{ $V{transaction_detail_ref01_markdef_up0_name} }, $V{transaction_detail_ref01_markdef_up0_value}, 'transaction_detail update: mark');

  # LOAD
  $V{transaction_detail_ref01_match_dt0} = {
    'id' => $V{transaction_detail_ref01_data}{id},
  };
  $V{transaction_detail_ref01_data_dt0_loaded} = $V{transaction_detail_ref01_ent}->load($V{transaction_detail_ref01_match_dt0}, undef);
  $V{transaction_detail_ref01_data_dt0_load_result} = BluefinPayconexHelpers::to_map($V{transaction_detail_ref01_data_dt0_loaded});
  ok(defined $V{transaction_detail_ref01_data_dt0_load_result}, 'transaction_detail load: data');
  is($V{transaction_detail_ref01_data_dt0_load_result}{id}, $V{transaction_detail_ref01_data}{id}, 'transaction_detail load: id');

}

sub transaction_detail_basic_setup {
  my ($extra) = @_;
  BluefinPayconexTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/transaction_detail/TransactionDetailTestData.json");
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
    ['transaction_detail01', 'transaction_detail02', 'transaction_detail03', 'account01', 'account02', 'account03', 'payment01', 'payment02', 'payment03'],
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
  my $entid_env_raw = $ENV{'BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinPayconexTestRunner::env_override({
    'BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID' => $idmap,
    'BLUEFINPAYCONEX_TEST_LIVE' => 'FALSE',
    'BLUEFINPAYCONEX_TEST_EXPLAIN' => 'FALSE',
    'BLUEFINPAYCONEX_APIKEY' => 'NONE',
  });

  my $idmap_resolved = BluefinPayconexHelpers::to_map($env->{'BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID'});
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
