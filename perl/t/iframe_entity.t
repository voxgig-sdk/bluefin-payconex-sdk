#!perl
# Iframe entity test

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
  my $ent = $testsdk->Iframe(undef);
  ok(defined $ent, 'iframe: create instance');
}

BASIC_FLOW: {
  my $setup = iframe_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op ('create', 'list', 'update', 'load') {
    my ($_should_skip, $_reason) = BluefinPayconexTestRunner::is_control_skipped(
      'entityOp', "iframe." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('iframe: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  # The basic flow consumes synthetic IDs from the fixture. In live mode
  # without an *_ENTID env override, those IDs hit the live API and 4xx.
  if ($setup->{synthetic_only}) {
    note('live entity test uses synthetic IDs from fixture - set BLUEFINPAYCONEX_TEST_IFRAME_ENTID JSON to run live');
    pass('iframe: basic flow skipped (synthetic IDs only)');
    last BASIC_FLOW;
  }
  my $client = $setup->{client};
  my %V;

  # CREATE
  $V{iframe_ref01_ent} = $client->Iframe(undef);
  $V{iframe_ref01_data} = BluefinPayconexHelpers::to_map(BluefinPayconexHelpers::gp(
    BluefinPayconexHelpers::gpath($setup->{data}, 'new.iframe'), 'iframe_ref01'));
  $V{iframe_ref01_data}{'account_id'} = $setup->{idmap}{'account01'};

  $V{iframe_ref01_data_result} = $V{iframe_ref01_ent}->create($V{iframe_ref01_data}, undef);
  $V{iframe_ref01_data} = BluefinPayconexHelpers::to_map($V{iframe_ref01_data_result});
  ok(defined $V{iframe_ref01_data}, 'iframe create: data');
  ok(defined $V{iframe_ref01_data}{id}, 'iframe create: id');

  # LIST
  $V{iframe_ref01_match} = {
    'account_id' => $setup->{idmap}{'account01'},
  };

  $V{iframe_ref01_list_result} = $V{iframe_ref01_ent}->list($V{iframe_ref01_match}, undef);
  ok(Voxgig::Struct::islist($V{iframe_ref01_list_result}), 'iframe list: is array');

  $V{found_item} = Voxgig::Struct::select(
    BluefinPayconexTestRunner::entity_list_to_data($V{iframe_ref01_list_result}),
    { 'id' => $V{iframe_ref01_data}{id} });
  ok(!Voxgig::Struct::isempty($V{found_item}), 'iframe list: item exists');

  # UPDATE
  $V{iframe_ref01_data_up0_up} = {
    'id' => $V{iframe_ref01_data}{id},
    'account_id' => $setup->{idmap}{'account_id'},
  };

  $V{iframe_ref01_markdef_up0_name} = 'currency';
  $V{iframe_ref01_markdef_up0_value} = 'Mark01-iframe_ref01_' . $setup->{now};
  $V{iframe_ref01_data_up0_up}{ $V{iframe_ref01_markdef_up0_name} } = $V{iframe_ref01_markdef_up0_value};

  $V{iframe_ref01_resdata_up0_result} = $V{iframe_ref01_ent}->update($V{iframe_ref01_data_up0_up}, undef);
  $V{iframe_ref01_resdata_up0} = BluefinPayconexHelpers::to_map($V{iframe_ref01_resdata_up0_result});
  ok(defined $V{iframe_ref01_resdata_up0}, 'iframe update: data');
  is($V{iframe_ref01_resdata_up0}{id}, $V{iframe_ref01_data_up0_up}{id}, 'iframe update: id');
  is($V{iframe_ref01_resdata_up0}{ $V{iframe_ref01_markdef_up0_name} }, $V{iframe_ref01_markdef_up0_value}, 'iframe update: mark');

  # LOAD
  $V{iframe_ref01_match_dt0} = {
    'id' => $V{iframe_ref01_data}{id},
  };
  $V{iframe_ref01_data_dt0_loaded} = $V{iframe_ref01_ent}->load($V{iframe_ref01_match_dt0}, undef);
  $V{iframe_ref01_data_dt0_load_result} = BluefinPayconexHelpers::to_map($V{iframe_ref01_data_dt0_loaded});
  ok(defined $V{iframe_ref01_data_dt0_load_result}, 'iframe load: data');
  is($V{iframe_ref01_data_dt0_load_result}{id}, $V{iframe_ref01_data}{id}, 'iframe load: id');

}

sub iframe_basic_setup {
  my ($extra) = @_;
  BluefinPayconexTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/iframe/IframeTestData.json");
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
    ['iframe01', 'iframe02', 'iframe03', 'account01', 'account02', 'account03', 'payment_iframe01', 'payment_iframe02', 'payment_iframe03'],
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
  my $entid_env_raw = $ENV{'BLUEFINPAYCONEX_TEST_IFRAME_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinPayconexTestRunner::env_override({
    'BLUEFINPAYCONEX_TEST_IFRAME_ENTID' => $idmap,
    'BLUEFINPAYCONEX_TEST_LIVE' => 'FALSE',
    'BLUEFINPAYCONEX_TEST_EXPLAIN' => 'FALSE',
    'BLUEFINPAYCONEX_APIKEY' => 'NONE',
  });

  my $idmap_resolved = BluefinPayconexHelpers::to_map($env->{'BLUEFINPAYCONEX_TEST_IFRAME_ENTID'});
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
