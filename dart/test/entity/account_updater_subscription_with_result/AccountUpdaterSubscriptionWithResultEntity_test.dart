// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import '../../harness.dart';
import '../../utility.dart';

import '../../../lib/BluefinPayconexSDK.dart';
import '../../../lib/utility/voxgig_struct.dart' as vs;

void tests() {
  describe('AccountUpdaterSubscriptionWithResultEntity', () {
    test('instance', (t) async {
      final testsdk = BluefinPayconexSDK.test();
      final ent = testsdk.AccountUpdaterSubscriptionWithResult();
      ok(null != ent);
    });



    test('basic', (t) async {

      final live = 'TRUE' == Platform.environment['BLUEFIN_PAYCONEX_TEST_LIVE'];
      for (final op in ['create', 'update', 'load']) {
        if (maybeSkipControl(t, 'entityOp', 'account_updater_subscription_with_result.' + op, live)) {
          return;
        }
      }

      final setup = basicSetup();
      // The basic flow consumes synthetic IDs and field values from the
      // fixture (entity TestData.json). Those don't exist on the live API.
      // Skip live runs unless the user provided a real ENTID env override.
      if (true == setup['syntheticOnly']) {
        t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID JSON to run live');
        return;
      }
      final client = setup['client'];
      final struct = setup['struct'];

      final isempty = struct.isempty;
      final select = struct.select;


      // CREATE
      final account_updater_subscription_with_result_ref01_ent = client.AccountUpdaterSubscriptionWithResult();
      dynamic account_updater_subscription_with_result_ref01_data = setup['data']['new']['account_updater_subscription_with_result']['account_updater_subscription_with_result_ref01'];
      account_updater_subscription_with_result_ref01_data['account_id'] = setup['idmap']['account01'];
      account_updater_subscription_with_result_ref01_data['subscription_id'] = setup['idmap']['subscription01'];

      account_updater_subscription_with_result_ref01_data = await account_updater_subscription_with_result_ref01_ent.create(account_updater_subscription_with_result_ref01_data);
      ok(null != account_updater_subscription_with_result_ref01_data['id']);


      // UPDATE
      final account_updater_subscription_with_result_ref01_data_up0 = <String, dynamic>{};
      account_updater_subscription_with_result_ref01_data_up0['id'] = account_updater_subscription_with_result_ref01_data['id'];
      account_updater_subscription_with_result_ref01_data_up0['account_id'] = setup['idmap']['account_id'];

      final account_updater_subscription_with_result_ref01_markdef_up0 = <String, dynamic>{
        'name': 'created_at',
        'value': 'Mark01-account_updater_subscription_with_result_ref01_' + setup['now'].toString(),
      };
      account_updater_subscription_with_result_ref01_data_up0[account_updater_subscription_with_result_ref01_markdef_up0['name']] = account_updater_subscription_with_result_ref01_markdef_up0['value'];

      final account_updater_subscription_with_result_ref01_resdata_up0 = await account_updater_subscription_with_result_ref01_ent.update(account_updater_subscription_with_result_ref01_data_up0);
      ok(account_updater_subscription_with_result_ref01_resdata_up0['id'] == account_updater_subscription_with_result_ref01_data_up0['id']);

      ok(account_updater_subscription_with_result_ref01_resdata_up0[account_updater_subscription_with_result_ref01_markdef_up0['name']] == account_updater_subscription_with_result_ref01_markdef_up0['value']);


      // LOAD
      final account_updater_subscription_with_result_ref01_match_dt0 = <String, dynamic>{};
      account_updater_subscription_with_result_ref01_match_dt0['id'] = account_updater_subscription_with_result_ref01_data['id'];
      final account_updater_subscription_with_result_ref01_data_dt0 = await account_updater_subscription_with_result_ref01_ent.load(account_updater_subscription_with_result_ref01_match_dt0);
      ok(account_updater_subscription_with_result_ref01_data_dt0['id'] == account_updater_subscription_with_result_ref01_data['id']);


    });
  });
}


Map<String, dynamic> basicSetup([dynamic extra]) {
  final options = <String, dynamic>{};

  final entityDataFile = resolveTestPath(
      '../.sdk/test/entity/account_updater_subscription_with_result/AccountUpdaterSubscriptionWithResultTestData.json');

  final entityDataSource = File(entityDataFile).readAsStringSync();

  final entityData = jsonDecode(entityDataSource);

  options['entity'] = entityData['existing'];

  var client = BluefinPayconexSDK.test(options, extra);
  final struct = client.utility().struct;
  final merge = struct.merge;
  final transform = struct.transform;

  dynamic idmap = transform(
      <dynamic>['account_updater_subscription_with_result01', 'account_updater_subscription_with_result02', 'account_updater_subscription_with_result03', 'account01', 'account02', 'account03', 'subscription01', 'subscription02', 'subscription03'],
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
      Platform.environment['BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID'];
  final idmapOverridden =
      null != idmapEnvVal && idmapEnvVal.trim().startsWith('{');

  final env = envOverride({
    'BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID': idmap,
    'BLUEFIN_PAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFIN_PAYCONEX_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_PAYCONEX_APIKEY': 'NONE',
  });

  idmap = env['BLUEFIN_PAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID'];

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

