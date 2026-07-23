// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import '../../harness.dart';
import '../../utility.dart';

import '../../../lib/BluefinPayconexSDK.dart';
import '../../../lib/utility/voxgig_struct.dart' as vs;

void tests() {
  describe('AccountUpdaterScheduleWithResultEntity', () {
    test('instance', (t) async {
      final testsdk = BluefinPayconexSDK.test();
      final ent = testsdk.AccountUpdaterScheduleWithResult();
      ok(null != ent);
    });

    test('stream', (t) async {
      // stream() runs the list op through the full pipeline and yields each
      // result item. Seed two entities via test mode; with the `streaming`
      // feature active it yields the feature's incremental items, else it
      // falls back to the materialised items — either way every item yields.
      final seed = <String, dynamic>{
        'entity': {
          'account_updater_schedule_with_result': {
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
      final ent = testsdk.AccountUpdaterScheduleWithResult();

      final seen = [];
      await for (final item in ent.stream('list', <String, dynamic>{})) {
        seen.add(item);
      }
      equal(2, seen.length);

      // Fallback: with streaming inactive, stream() still yields both items
      // from the materialised result.
      final plainsdk = BluefinPayconexSDK.test(seed);
      final plainent = plainsdk.AccountUpdaterScheduleWithResult();
      final seen2 = [];
      await for (final item in plainent.stream('list', <String, dynamic>{})) {
        seen2.add(item);
      }
      equal(2, seen2.length);
    });

    test('basic', (t) async {

      final live = 'TRUE' == Platform.environment['BLUEFIN_PAYCONEX_TEST_LIVE'];
      for (final op in ['create', 'list']) {
        if (maybeSkipControl(t, 'entityOp', 'account_updater_schedule_with_result.' + op, live)) {
          return;
        }
      }

      final setup = basicSetup();
      // The basic flow consumes synthetic IDs and field values from the
      // fixture (entity TestData.json). Those don't exist on the live API.
      // Skip live runs unless the user provided a real ENTID env override.
      if (true == setup['syntheticOnly']) {
        t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID JSON to run live');
        return;
      }
      final client = setup['client'];
      final struct = setup['struct'];

      final isempty = struct.isempty;
      final select = struct.select;


      // CREATE
      final account_updater_schedule_with_result_ref01_ent = client.AccountUpdaterScheduleWithResult();
      dynamic account_updater_schedule_with_result_ref01_data = setup['data']['new']['account_updater_schedule_with_result']['account_updater_schedule_with_result_ref01'];
      account_updater_schedule_with_result_ref01_data['account_id'] = setup['idmap']['account01'];
      account_updater_schedule_with_result_ref01_data['schedule_id'] = setup['idmap']['schedule01'];

      account_updater_schedule_with_result_ref01_data = await account_updater_schedule_with_result_ref01_ent.create(account_updater_schedule_with_result_ref01_data);
      ok(null != account_updater_schedule_with_result_ref01_data['id']);


      // LIST
      final account_updater_schedule_with_result_ref01_match = <String, dynamic>{};
      account_updater_schedule_with_result_ref01_match['account_id'] = setup['idmap']['account01'];
      account_updater_schedule_with_result_ref01_match['schedule_id'] = setup['idmap']['schedule01'];

      final account_updater_schedule_with_result_ref01_list = await account_updater_schedule_with_result_ref01_ent.list(account_updater_schedule_with_result_ref01_match);

      ok(!isempty(select(
          (account_updater_schedule_with_result_ref01_list as List).map((e) => e.data()).toList(),
          {'id': account_updater_schedule_with_result_ref01_data['id']})));


    });
  });
}


Map<String, dynamic> basicSetup([dynamic extra]) {
  final options = <String, dynamic>{};

  final entityDataFile = resolveTestPath(
      '../.sdk/test/entity/account_updater_schedule_with_result/AccountUpdaterScheduleWithResultTestData.json');

  final entityDataSource = File(entityDataFile).readAsStringSync();

  final entityData = jsonDecode(entityDataSource);

  options['entity'] = entityData['existing'];

  var client = BluefinPayconexSDK.test(options, extra);
  final struct = client.utility().struct;
  final merge = struct.merge;
  final transform = struct.transform;

  dynamic idmap = transform(
      <dynamic>['account_updater_schedule_with_result01', 'account_updater_schedule_with_result02', 'account_updater_schedule_with_result03', 'account01', 'account02', 'account03', 'account01', 'account02', 'account03', 'schedule01', 'schedule02', 'schedule03'],
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
      Platform.environment['BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID'];
  final idmapOverridden =
      null != idmapEnvVal && idmapEnvVal.trim().startsWith('{');

  final env = envOverride({
    'BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID': idmap,
    'BLUEFIN_PAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFIN_PAYCONEX_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_PAYCONEX_APIKEY': 'NONE',
  });

  idmap = env['BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID'];

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

