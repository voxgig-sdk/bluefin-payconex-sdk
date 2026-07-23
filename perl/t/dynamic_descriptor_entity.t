#!perl
# DynamicDescriptor entity test

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
  my $ent = $testsdk->DynamicDescriptor(undef);
  ok(defined $ent, 'dynamic_descriptor: create instance');
}

BASIC_FLOW: {
  my $setup = dynamic_descriptor_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op ('create', 'list', 'update', 'load', 'remove') {
    my ($_should_skip, $_reason) = BluefinPayconexTestRunner::is_control_skipped(
      'entityOp', "dynamic_descriptor." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('dynamic_descriptor: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  # The basic flow consumes synthetic IDs from the fixture. In live mode
  # without an *_ENTID env override, those IDs hit the live API and 4xx.
  if ($setup->{synthetic_only}) {
    note('live entity test uses synthetic IDs from fixture - set BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID JSON to run live');
    pass('dynamic_descriptor: basic flow skipped (synthetic IDs only)');
    last BASIC_FLOW;
  }
  my $client = $setup->{client};
  my %V;

  # CREATE
  $V{dynamic_descriptor_ref01_ent} = $client->DynamicDescriptor(undef);
  $V{dynamic_descriptor_ref01_data} = BluefinPayconexHelpers::to_map(BluefinPayconexHelpers::gp(
    BluefinPayconexHelpers::gpath($setup->{data}, 'new.dynamic_descriptor'), 'dynamic_descriptor_ref01'));
  $V{dynamic_descriptor_ref01_data}{'account_id'} = $setup->{idmap}{'account01'};

  $V{dynamic_descriptor_ref01_data_result} = $V{dynamic_descriptor_ref01_ent}->create($V{dynamic_descriptor_ref01_data}, undef);
  $V{dynamic_descriptor_ref01_data} = BluefinPayconexHelpers::to_map($V{dynamic_descriptor_ref01_data_result});
  ok(defined $V{dynamic_descriptor_ref01_data}, 'dynamic_descriptor create: data');
  ok(defined $V{dynamic_descriptor_ref01_data}{id}, 'dynamic_descriptor create: id');

  # LIST
  $V{dynamic_descriptor_ref01_match} = {
    'account_id' => $setup->{idmap}{'account01'},
  };

  $V{dynamic_descriptor_ref01_list_result} = $V{dynamic_descriptor_ref01_ent}->list($V{dynamic_descriptor_ref01_match}, undef);
  ok(Voxgig::Struct::islist($V{dynamic_descriptor_ref01_list_result}), 'dynamic_descriptor list: is array');

  $V{found_item} = Voxgig::Struct::select(
    BluefinPayconexTestRunner::entity_list_to_data($V{dynamic_descriptor_ref01_list_result}),
    { 'id' => $V{dynamic_descriptor_ref01_data}{id} });
  ok(!Voxgig::Struct::isempty($V{found_item}), 'dynamic_descriptor list: item exists');

  # UPDATE
  $V{dynamic_descriptor_ref01_data_up0_up} = {
    'id' => $V{dynamic_descriptor_ref01_data}{id},
    'account_id' => $setup->{idmap}{'account_id'},
  };

  $V{dynamic_descriptor_ref01_markdef_up0_name} = 'city';
  $V{dynamic_descriptor_ref01_markdef_up0_value} = 'Mark01-dynamic_descriptor_ref01_' . $setup->{now};
  $V{dynamic_descriptor_ref01_data_up0_up}{ $V{dynamic_descriptor_ref01_markdef_up0_name} } = $V{dynamic_descriptor_ref01_markdef_up0_value};

  $V{dynamic_descriptor_ref01_resdata_up0_result} = $V{dynamic_descriptor_ref01_ent}->update($V{dynamic_descriptor_ref01_data_up0_up}, undef);
  $V{dynamic_descriptor_ref01_resdata_up0} = BluefinPayconexHelpers::to_map($V{dynamic_descriptor_ref01_resdata_up0_result});
  ok(defined $V{dynamic_descriptor_ref01_resdata_up0}, 'dynamic_descriptor update: data');
  is($V{dynamic_descriptor_ref01_resdata_up0}{id}, $V{dynamic_descriptor_ref01_data_up0_up}{id}, 'dynamic_descriptor update: id');
  is($V{dynamic_descriptor_ref01_resdata_up0}{ $V{dynamic_descriptor_ref01_markdef_up0_name} }, $V{dynamic_descriptor_ref01_markdef_up0_value}, 'dynamic_descriptor update: mark');

  # LOAD
  $V{dynamic_descriptor_ref01_match_dt0} = {
    'id' => $V{dynamic_descriptor_ref01_data}{id},
  };
  $V{dynamic_descriptor_ref01_data_dt0_loaded} = $V{dynamic_descriptor_ref01_ent}->load($V{dynamic_descriptor_ref01_match_dt0}, undef);
  $V{dynamic_descriptor_ref01_data_dt0_load_result} = BluefinPayconexHelpers::to_map($V{dynamic_descriptor_ref01_data_dt0_loaded});
  ok(defined $V{dynamic_descriptor_ref01_data_dt0_load_result}, 'dynamic_descriptor load: data');
  is($V{dynamic_descriptor_ref01_data_dt0_load_result}{id}, $V{dynamic_descriptor_ref01_data}{id}, 'dynamic_descriptor load: id');

  # REMOVE
  $V{dynamic_descriptor_ref01_match_rm0} = {
    'id' => $V{dynamic_descriptor_ref01_data}{id},
  };
  $V{dynamic_descriptor_ref01_ent}->remove($V{dynamic_descriptor_ref01_match_rm0}, undef);
  pass('dynamic_descriptor remove: completed');

  # LIST
  $V{dynamic_descriptor_ref01_match_rt0} = {
    'account_id' => $setup->{idmap}{'account01'},
  };

  $V{dynamic_descriptor_ref01_list_rt0_result} = $V{dynamic_descriptor_ref01_ent}->list($V{dynamic_descriptor_ref01_match_rt0}, undef);
  ok(Voxgig::Struct::islist($V{dynamic_descriptor_ref01_list_rt0_result}), 'dynamic_descriptor list: is array');

  $V{not_found_item} = Voxgig::Struct::select(
    BluefinPayconexTestRunner::entity_list_to_data($V{dynamic_descriptor_ref01_list_rt0_result}),
    { 'id' => $V{dynamic_descriptor_ref01_data}{id} });
  ok(Voxgig::Struct::isempty($V{not_found_item}), 'dynamic_descriptor list: item not exists');

}

sub dynamic_descriptor_basic_setup {
  my ($extra) = @_;
  BluefinPayconexTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/dynamic_descriptor/DynamicDescriptorTestData.json");
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
    ['dynamic_descriptor01', 'dynamic_descriptor02', 'dynamic_descriptor03', 'account01', 'account02', 'account03'],
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
  my $entid_env_raw = $ENV{'BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinPayconexTestRunner::env_override({
    'BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID' => $idmap,
    'BLUEFINPAYCONEX_TEST_LIVE' => 'FALSE',
    'BLUEFINPAYCONEX_TEST_EXPLAIN' => 'FALSE',
    'BLUEFINPAYCONEX_APIKEY' => 'NONE',
  });

  my $idmap_resolved = BluefinPayconexHelpers::to_map($env->{'BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID'});
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
