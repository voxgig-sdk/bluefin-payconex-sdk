#!perl
# ListApiKeyScopesEntry entity test

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
  my $ent = $testsdk->ListApiKeyScopesEntry(undef);
  ok(defined $ent, 'list_api_key_scopes_entry: create instance');
}

BASIC_FLOW: {
  my $setup = list_api_key_scopes_entry_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op ('list') {
    my ($_should_skip, $_reason) = BluefinPayconexTestRunner::is_control_skipped(
      'entityOp', "list_api_key_scopes_entry." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('list_api_key_scopes_entry: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  # The basic flow consumes synthetic IDs from the fixture. In live mode
  # without an *_ENTID env override, those IDs hit the live API and 4xx.
  if ($setup->{synthetic_only}) {
    note('live entity test uses synthetic IDs from fixture - set BLUEFINPAYCONEX_TEST_LIST_API_KEY_SCOPES_ENTRY_ENTID JSON to run live');
    pass('list_api_key_scopes_entry: basic flow skipped (synthetic IDs only)');
    last BASIC_FLOW;
  }
  my $client = $setup->{client};
  my %V;

  # Bootstrap entity data from existing test data.
  $V{list_api_key_scopes_entry_ref01_data_raw} = Voxgig::Struct::items(BluefinPayconexHelpers::to_map(
    BluefinPayconexHelpers::gpath($setup->{data}, 'existing.list_api_key_scopes_entry')));
  $V{list_api_key_scopes_entry_ref01_data} = undef;
  if (@{ $V{list_api_key_scopes_entry_ref01_data_raw} || [] }) {
    $V{list_api_key_scopes_entry_ref01_data} = BluefinPayconexHelpers::to_map($V{list_api_key_scopes_entry_ref01_data_raw}[0][1]);
  }

  # LIST
  $V{list_api_key_scopes_entry_ref01_ent} = $client->ListApiKeyScopesEntry(undef);
  $V{list_api_key_scopes_entry_ref01_match} = {};

  $V{list_api_key_scopes_entry_ref01_list_result} = $V{list_api_key_scopes_entry_ref01_ent}->list($V{list_api_key_scopes_entry_ref01_match}, undef);
  ok(Voxgig::Struct::islist($V{list_api_key_scopes_entry_ref01_list_result}), 'list_api_key_scopes_entry list: is array');

}

sub list_api_key_scopes_entry_basic_setup {
  my ($extra) = @_;
  BluefinPayconexTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/list_api_key_scopes_entry/ListApiKeyScopesEntryTestData.json");
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
    ['list_api_key_scopes_entry01', 'list_api_key_scopes_entry02', 'list_api_key_scopes_entry03'],
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
  my $entid_env_raw = $ENV{'BLUEFINPAYCONEX_TEST_LIST_API_KEY_SCOPES_ENTRY_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinPayconexTestRunner::env_override({
    'BLUEFINPAYCONEX_TEST_LIST_API_KEY_SCOPES_ENTRY_ENTID' => $idmap,
    'BLUEFINPAYCONEX_TEST_LIVE' => 'FALSE',
    'BLUEFINPAYCONEX_TEST_EXPLAIN' => 'FALSE',
    'BLUEFINPAYCONEX_APIKEY' => 'NONE',
  });

  my $idmap_resolved = BluefinPayconexHelpers::to_map($env->{'BLUEFINPAYCONEX_TEST_LIST_API_KEY_SCOPES_ENTRY_ENTID'});
  if (!defined $idmap_resolved) {
    $idmap_resolved = BluefinPayconexHelpers::to_map($idmap);
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
