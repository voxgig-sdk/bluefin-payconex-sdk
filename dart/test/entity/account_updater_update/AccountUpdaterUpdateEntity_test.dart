// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import '../../harness.dart';
import '../../utility.dart';

import '../../../lib/BluefinPayconexSDK.dart';
import '../../../lib/utility/voxgig_struct.dart' as vs;

void tests() {
  describe('AccountUpdaterUpdateEntity', () {
    test('instance', (t) async {
      final testsdk = BluefinPayconexSDK.test();
      final ent = testsdk.AccountUpdaterUpdate();
      ok(null != ent);
    });



    test('basic', (t) async {

      final live = 'TRUE' == Platform.environment['BLUEFIN_PAYCONEX_TEST_LIVE'];
      for (final op in ['load']) {
        if (maybeSkipControl(t, 'entityOp', 'account_updater_update.' + op, live)) {
          return;
        }
      }

      final setup = basicSetup();
      // The basic flow consumes synthetic IDs and field values from the
      // fixture (entity TestData.json). Those don't exist on the live API.
      // Skip live runs unless the user provided a real ENTID env override.
      if (true == setup['syntheticOnly']) {
        t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID JSON to run live');
        return;
      }
      final client = setup['client'];
      final struct = setup['struct'];

      final isempty = struct.isempty;
      final select = struct.select;

      final account_updater_update_ref01_data =
          (setup['data']['existing']['account_updater_update'] as Map).values.first;

      // LOAD
      final account_updater_update_ref01_ent = client.AccountUpdaterUpdate();
      final account_updater_update_ref01_match_dt0 = <String, dynamic>{};
      account_updater_update_ref01_match_dt0['id'] = account_updater_update_ref01_data['id'];
      final account_updater_update_ref01_data_dt0 = await account_updater_update_ref01_ent.load(account_updater_update_ref01_match_dt0);
      ok(account_updater_update_ref01_data_dt0['id'] == account_updater_update_ref01_data['id']);


    });
  });
}


Map<String, dynamic> basicSetup([dynamic extra]) {
  final options = <String, dynamic>{};

  final entityDataFile = resolveTestPath(
      '../.sdk/test/entity/account_updater_update/AccountUpdaterUpdateTestData.json');

  final entityDataSource = File(entityDataFile).readAsStringSync();

  final entityData = jsonDecode(entityDataSource);

  options['entity'] = entityData['existing'];

  var client = BluefinPayconexSDK.test(options, extra);
  final struct = client.utility().struct;
  final merge = struct.merge;
  final transform = struct.transform;

  dynamic idmap = transform(
      <dynamic>['account_updater_update01', 'account_updater_update02', 'account_updater_update03', 'account01', 'account02', 'account03'],
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
      Platform.environment['BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID'];
  final idmapOverridden =
      null != idmapEnvVal && idmapEnvVal.trim().startsWith('{');

  final env = envOverride({
    'BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID': idmap,
    'BLUEFIN_PAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFIN_PAYCONEX_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_PAYCONEX_APIKEY': 'NONE',
  });

  idmap = env['BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID'];

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

