// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import '../../harness.dart';
import '../../utility.dart';

import '../../../lib/BluefinPayconexSDK.dart';
import '../../../lib/utility/voxgig_struct.dart' as vs;

void tests() {
  describe('IframeEntity', () {
    test('instance', (t) async {
      final testsdk = BluefinPayconexSDK.test();
      final ent = testsdk.Iframe();
      ok(null != ent);
    });

    test('stream', (t) async {
      // stream() runs the list op through the full pipeline and yields each
      // result item. Seed two entities via test mode; with the `streaming`
      // feature active it yields the feature's incremental items, else it
      // falls back to the materialised items — either way every item yields.
      final seed = <String, dynamic>{
        'entity': {
          'iframe': {
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
      final ent = testsdk.Iframe();

      final seen = [];
      await for (final item in ent.stream('list', <String, dynamic>{})) {
        seen.add(item);
      }
      equal(2, seen.length);

      // Fallback: with streaming inactive, stream() still yields both items
      // from the materialised result.
      final plainsdk = BluefinPayconexSDK.test(seed);
      final plainent = plainsdk.Iframe();
      final seen2 = [];
      await for (final item in plainent.stream('list', <String, dynamic>{})) {
        seen2.add(item);
      }
      equal(2, seen2.length);
    });

    test('basic', (t) async {

      final live = 'TRUE' == Platform.environment['BLUEFIN_PAYCONEX_TEST_LIVE'];
      for (final op in ['create', 'list', 'update', 'load']) {
        if (maybeSkipControl(t, 'entityOp', 'iframe.' + op, live)) {
          return;
        }
      }

      final setup = basicSetup();
      // The basic flow consumes synthetic IDs and field values from the
      // fixture (entity TestData.json). Those don't exist on the live API.
      // Skip live runs unless the user provided a real ENTID env override.
      if (true == setup['syntheticOnly']) {
        t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_PAYCONEX_TEST_IFRAME_ENTID JSON to run live');
        return;
      }
      final client = setup['client'];
      final struct = setup['struct'];

      final isempty = struct.isempty;
      final select = struct.select;


      // CREATE
      final iframe_ref01_ent = client.Iframe();
      dynamic iframe_ref01_data = setup['data']['new']['iframe']['iframe_ref01'];
      iframe_ref01_data['account_id'] = setup['idmap']['account01'];

      iframe_ref01_data = await iframe_ref01_ent.create(iframe_ref01_data);
      ok(null != iframe_ref01_data['id']);


      // LIST
      final iframe_ref01_match = <String, dynamic>{};
      iframe_ref01_match['account_id'] = setup['idmap']['account01'];

      final iframe_ref01_list = await iframe_ref01_ent.list(iframe_ref01_match);

      ok(!isempty(select(
          (iframe_ref01_list as List).map((e) => e.data()).toList(),
          {'id': iframe_ref01_data['id']})));


      // UPDATE
      final iframe_ref01_data_up0 = <String, dynamic>{};
      iframe_ref01_data_up0['id'] = iframe_ref01_data['id'];
      iframe_ref01_data_up0['account_id'] = setup['idmap']['account_id'];

      final iframe_ref01_markdef_up0 = <String, dynamic>{
        'name': 'currency',
        'value': 'Mark01-iframe_ref01_' + setup['now'].toString(),
      };
      iframe_ref01_data_up0[iframe_ref01_markdef_up0['name']] = iframe_ref01_markdef_up0['value'];

      final iframe_ref01_resdata_up0 = await iframe_ref01_ent.update(iframe_ref01_data_up0);
      ok(iframe_ref01_resdata_up0['id'] == iframe_ref01_data_up0['id']);

      ok(iframe_ref01_resdata_up0[iframe_ref01_markdef_up0['name']] == iframe_ref01_markdef_up0['value']);


      // LOAD
      final iframe_ref01_match_dt0 = <String, dynamic>{};
      iframe_ref01_match_dt0['id'] = iframe_ref01_data['id'];
      final iframe_ref01_data_dt0 = await iframe_ref01_ent.load(iframe_ref01_match_dt0);
      ok(iframe_ref01_data_dt0['id'] == iframe_ref01_data['id']);


    });
  });
}


Map<String, dynamic> basicSetup([dynamic extra]) {
  final options = <String, dynamic>{};

  final entityDataFile = resolveTestPath(
      '../.sdk/test/entity/iframe/IframeTestData.json');

  final entityDataSource = File(entityDataFile).readAsStringSync();

  final entityData = jsonDecode(entityDataSource);

  options['entity'] = entityData['existing'];

  var client = BluefinPayconexSDK.test(options, extra);
  final struct = client.utility().struct;
  final merge = struct.merge;
  final transform = struct.transform;

  dynamic idmap = transform(
      <dynamic>['iframe01', 'iframe02', 'iframe03', 'account01', 'account02', 'account03', 'account01', 'account02', 'account03', 'payment_iframe01', 'payment_iframe02', 'payment_iframe03'],
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
      Platform.environment['BLUEFIN_PAYCONEX_TEST_IFRAME_ENTID'];
  final idmapOverridden =
      null != idmapEnvVal && idmapEnvVal.trim().startsWith('{');

  final env = envOverride({
    'BLUEFIN_PAYCONEX_TEST_IFRAME_ENTID': idmap,
    'BLUEFIN_PAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFIN_PAYCONEX_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_PAYCONEX_APIKEY': 'NONE',
  });

  idmap = env['BLUEFIN_PAYCONEX_TEST_IFRAME_ENTID'];

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

