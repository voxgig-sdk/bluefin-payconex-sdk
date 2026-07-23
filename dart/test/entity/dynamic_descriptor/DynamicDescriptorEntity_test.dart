// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import '../../harness.dart';
import '../../utility.dart';

import '../../../lib/BluefinPayconexSDK.dart';
import '../../../lib/utility/voxgig_struct.dart' as vs;

void tests() {
  describe('DynamicDescriptorEntity', () {
    test('instance', (t) async {
      final testsdk = BluefinPayconexSDK.test();
      final ent = testsdk.DynamicDescriptor();
      ok(null != ent);
    });

test('stream', (t) async {
      // stream() runs the list op through the full pipeline and yields each
      // result item. Seed two entities via test mode; with the `streaming`
      // feature active it yields the feature's incremental items, else it
      // falls back to the materialised items — either way every item yields.
      final seed = <String, dynamic>{
        'entity': {
          'dynamic_descriptor': {
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
      final ent = testsdk.DynamicDescriptor();

      final seen = [];
      await for (final item in ent.stream('list', <String, dynamic>{})) {
        seen.add(item);
      }
      equal(2, seen.length);

      // Fallback: with streaming inactive, stream() still yields both items
      // from the materialised result.
      final plainsdk = BluefinPayconexSDK.test(seed);
      final plainent = plainsdk.DynamicDescriptor();
      final seen2 = [];
      await for (final item in plainent.stream('list', <String, dynamic>{})) {
        seen2.add(item);
      }
      equal(2, seen2.length);
    });


    test('basic', (t) async {

      final live = 'TRUE' == Platform.environment['BLUEFIN_PAYCONEX_TEST_LIVE'];
      for (final op in ['create', 'list', 'update', 'load', 'remove']) {
        if (maybeSkipControl(t, 'entityOp', 'dynamic_descriptor.' + op, live)) {
          return;
        }
      }

      final setup = basicSetup();
      // The basic flow consumes synthetic IDs and field values from the
      // fixture (entity TestData.json). Those don't exist on the live API.
      // Skip live runs unless the user provided a real ENTID env override.
      if (true == setup['syntheticOnly']) {
        t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_PAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID JSON to run live');
        return;
      }
      final client = setup['client'];
      final struct = setup['struct'];

      final isempty = struct.isempty;
      final select = struct.select;


      // CREATE
      final dynamic_descriptor_ref01_ent = client.DynamicDescriptor();
      dynamic dynamic_descriptor_ref01_data = setup['data']['new']['dynamic_descriptor']['dynamic_descriptor_ref01'];
      dynamic_descriptor_ref01_data['account_id'] = setup['idmap']['account01'];

      dynamic_descriptor_ref01_data = await dynamic_descriptor_ref01_ent.create(dynamic_descriptor_ref01_data);
      ok(null != dynamic_descriptor_ref01_data['id']);


      // LIST
      final dynamic_descriptor_ref01_match = <String, dynamic>{};
      dynamic_descriptor_ref01_match['account_id'] = setup['idmap']['account01'];

      final dynamic_descriptor_ref01_list = await dynamic_descriptor_ref01_ent.list(dynamic_descriptor_ref01_match);

      ok(!isempty(select(
          (dynamic_descriptor_ref01_list as List).map((e) => e.data()).toList(),
          {'id': dynamic_descriptor_ref01_data['id']})));


      // UPDATE
      final dynamic_descriptor_ref01_data_up0 = <String, dynamic>{};
      dynamic_descriptor_ref01_data_up0['id'] = dynamic_descriptor_ref01_data['id'];
      dynamic_descriptor_ref01_data_up0['account_id'] = setup['idmap']['account_id'];

      final dynamic_descriptor_ref01_markdef_up0 = <String, dynamic>{
        'name': 'city',
        'value': 'Mark01-dynamic_descriptor_ref01_' + setup['now'].toString(),
      };
      dynamic_descriptor_ref01_data_up0[dynamic_descriptor_ref01_markdef_up0['name']] = dynamic_descriptor_ref01_markdef_up0['value'];

      final dynamic_descriptor_ref01_resdata_up0 = await dynamic_descriptor_ref01_ent.update(dynamic_descriptor_ref01_data_up0);
      ok(dynamic_descriptor_ref01_resdata_up0['id'] == dynamic_descriptor_ref01_data_up0['id']);

      ok(dynamic_descriptor_ref01_resdata_up0[dynamic_descriptor_ref01_markdef_up0['name']] == dynamic_descriptor_ref01_markdef_up0['value']);


      // LOAD
      final dynamic_descriptor_ref01_match_dt0 = <String, dynamic>{};
      dynamic_descriptor_ref01_match_dt0['id'] = dynamic_descriptor_ref01_data['id'];
      final dynamic_descriptor_ref01_data_dt0 = await dynamic_descriptor_ref01_ent.load(dynamic_descriptor_ref01_match_dt0);
      ok(dynamic_descriptor_ref01_data_dt0['id'] == dynamic_descriptor_ref01_data['id']);


      // REMOVE
      final dynamic_descriptor_ref01_match_rm0 = <String, dynamic>{'id': dynamic_descriptor_ref01_data['id']};
      await dynamic_descriptor_ref01_ent.remove(dynamic_descriptor_ref01_match_rm0);


      // LIST
      final dynamic_descriptor_ref01_match_rt0 = <String, dynamic>{};
      dynamic_descriptor_ref01_match_rt0['account_id'] = setup['idmap']['account01'];

      final dynamic_descriptor_ref01_list_rt0 = await dynamic_descriptor_ref01_ent.list(dynamic_descriptor_ref01_match_rt0);

      ok(isempty(select(
          (dynamic_descriptor_ref01_list_rt0 as List).map((e) => e.data()).toList(),
          {'id': dynamic_descriptor_ref01_data['id']})));


    });
  });
}


Map<String, dynamic> basicSetup([dynamic extra]) {
  final options = <String, dynamic>{};

  final entityDataFile = resolveTestPath(
      '../.sdk/test/entity/dynamic_descriptor/DynamicDescriptorTestData.json');

  final entityDataSource = File(entityDataFile).readAsStringSync();

  final entityData = jsonDecode(entityDataSource);

  options['entity'] = entityData['existing'];

  var client = BluefinPayconexSDK.test(options, extra);
  final struct = client.utility().struct;
  final merge = struct.merge;
  final transform = struct.transform;

  dynamic idmap = transform(
      <dynamic>['dynamic_descriptor01', 'dynamic_descriptor02', 'dynamic_descriptor03', 'account01', 'account02', 'account03'],
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
      Platform.environment['BLUEFIN_PAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID'];
  final idmapOverridden =
      null != idmapEnvVal && idmapEnvVal.trim().startsWith('{');

  final env = envOverride({
    'BLUEFIN_PAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID': idmap,
    'BLUEFIN_PAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFIN_PAYCONEX_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_PAYCONEX_APIKEY': 'NONE',
  });

  idmap = env['BLUEFIN_PAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID'];

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

