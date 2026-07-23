// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import '../../harness.dart';
import '../../utility.dart';

import '../../../lib/BluefinPayconexSDK.dart';
import '../../../lib/utility/voxgig_struct.dart' as vs;

void tests() {
  describe('ListApiKeyScopesEntryEntity', () {
    test('instance', (t) async {
      final testsdk = BluefinPayconexSDK.test();
      final ent = testsdk.ListApiKeyScopesEntry();
      ok(null != ent);
    });

test('stream', (t) async {
      // stream() runs the list op through the full pipeline and yields each
      // result item. Seed two entities via test mode; with the `streaming`
      // feature active it yields the feature's incremental items, else it
      // falls back to the materialised items — either way every item yields.
      final seed = <String, dynamic>{
        'entity': {
          'list_api_key_scopes_entry': {
            'strm01': <String, dynamic>{'id': 'strm01'},
            'strm02': <String, dynamic>{'id': 'strm02'},
          }
        }
      };

      final sdkopts = <String, dynamic>{};
      if (null != config.feature['streaming']) {
        sdkopts['feature'] = {
          'streaming': {'active': true}
        };
      }

      final testsdk = BluefinPayconexSDK.test(seed, sdkopts);
      final ent = testsdk.ListApiKeyScopesEntry();

      final seen = [];
      await for (final item in ent.stream('list', <String, dynamic>{})) {
        seen.add(item);
      }
      equal(2, seen.length);

      // Fallback: with streaming inactive, stream() still yields both items
      // from the materialised result.
      final plainsdk = BluefinPayconexSDK.test(seed);
      final plainent = plainsdk.ListApiKeyScopesEntry();
      final seen2 = [];
      await for (final item in plainent.stream('list', <String, dynamic>{})) {
        seen2.add(item);
      }
      equal(2, seen2.length);
    });


    test('basic', (t) async {

      final live = 'TRUE' == Platform.environment['BLUEFIN_PAYCONEX_TEST_LIVE'];
      for (final op in ['list']) {
        if (maybeSkipControl(t, 'entityOp', 'list_api_key_scopes_entry.' + op, live)) {
          return;
        }
      }

      final setup = basicSetup();
      // The basic flow consumes synthetic IDs and field values from the
      // fixture (entity TestData.json). Those don't exist on the live API.
      // Skip live runs unless the user provided a real ENTID env override.
      if (true == setup['syntheticOnly']) {
        t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_PAYCONEX_TEST_LIST_API_KEY_SCOPES_ENTRY_ENTID JSON to run live');
        return;
      }
      final client = setup['client'];
      final struct = setup['struct'];

      final isempty = struct.isempty;
      final select = struct.select;

      final list_api_key_scopes_entry_ref01_data =
          (setup['data']['existing']['list_api_key_scopes_entry'] as Map).values.first;

      // LIST
      final list_api_key_scopes_entry_ref01_ent = client.ListApiKeyScopesEntry();
      final list_api_key_scopes_entry_ref01_match = <String, dynamic>{};

      final list_api_key_scopes_entry_ref01_list = await list_api_key_scopes_entry_ref01_ent.list(list_api_key_scopes_entry_ref01_match);


    });
  });
}


Map<String, dynamic> basicSetup([dynamic extra]) {
  final options = <String, dynamic>{};

  final entityDataFile = resolveTestPath(
      '../.sdk/test/entity/list_api_key_scopes_entry/ListApiKeyScopesEntryTestData.json');

  final entityDataSource = File(entityDataFile).readAsStringSync();

  final entityData = jsonDecode(entityDataSource);

  options['entity'] = entityData['existing'];

  var client = BluefinPayconexSDK.test(options, extra);
  final struct = client.utility().struct;
  final merge = struct.merge;
  final transform = struct.transform;

  dynamic idmap = transform(
      <dynamic>['list_api_key_scopes_entry01', 'list_api_key_scopes_entry02', 'list_api_key_scopes_entry03'],
      <String, dynamic>{
        '`\$PACK`': <dynamic>[
          '',
          <String, dynamic>{
            '`\$KEY`': '`\$COPY`',
            '`\$VAL`': <dynamic>['`\$FORMAT`', 'upper', '`\$COPY`'],
          }
        ]
      });

  // Detect whether the user provided a real ENTID JSON via env var. The
  // basic flow consumes synthetic IDs from the fixture file; without an
  // override those synthetic IDs reach the live API and 4xx. Surface this
  // to the test so it can skip rather than fail.
  final idmapEnvVal =
      Platform.environment['BLUEFIN_PAYCONEX_TEST_LIST_API_KEY_SCOPES_ENTRY_ENTID'];
  final idmapOverridden =
      null != idmapEnvVal && idmapEnvVal.trim().startsWith('{');

  final env = envOverride({
    'BLUEFIN_PAYCONEX_TEST_LIST_API_KEY_SCOPES_ENTRY_ENTID': idmap,
    'BLUEFIN_PAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFIN_PAYCONEX_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_PAYCONEX_APIKEY': 'NONE',
  });

  idmap = env['BLUEFIN_PAYCONEX_TEST_LIST_API_KEY_SCOPES_ENTRY_ENTID'];

  final live = 'TRUE' == env['BLUEFIN_PAYCONEX_TEST_LIVE'];

  if (live) {
    client = BluefinPayconexSDK(merge([
      <String, dynamic>{
        'apikey': env['BLUEFIN_PAYCONEX_APIKEY'],
      },
      extra
    ]));
  }

  final setup = <String, dynamic>{
    'idmap': idmap,
    'env': env,
    'options': options,
    'client': client,
    'struct': struct,
    'data': entityData,
    'explain': 'TRUE' == env['BLUEFIN_PAYCONEX_TEST_EXPLAIN'],
    'live': live,
    'syntheticOnly': live && !idmapOverridden,
    'now': DateTime.now().millisecondsSinceEpoch,
  };

  return setup;
}

