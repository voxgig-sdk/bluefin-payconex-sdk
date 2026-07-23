// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import '../../harness.dart';
import '../../utility.dart';

import '../../../lib/BluefinPayconexSDK.dart';
import '../../../lib/utility/voxgig_struct.dart' as vs;

void tests() {
  describe('ApplePaySessionEntity', () {
    test('instance', (t) async {
      final testsdk = BluefinPayconexSDK.test();
      final ent = testsdk.ApplePaySession();
      ok(null != ent);
    });



    test('basic', (t) async {

      final live = 'TRUE' == Platform.environment['BLUEFIN_PAYCONEX_TEST_LIVE'];
      for (final op in ['create']) {
        if (maybeSkipControl(t, 'entityOp', 'apple_pay_session.' + op, live)) {
          return;
        }
      }

      final setup = basicSetup();
      // The basic flow consumes synthetic IDs and field values from the
      // fixture (entity TestData.json). Those don't exist on the live API.
      // Skip live runs unless the user provided a real ENTID env override.
      if (true == setup['syntheticOnly']) {
        t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_PAYCONEX_TEST_APPLE_PAY_SESSION_ENTID JSON to run live');
        return;
      }
      final client = setup['client'];
      final struct = setup['struct'];

      final isempty = struct.isempty;
      final select = struct.select;


      // CREATE
      final apple_pay_session_ref01_ent = client.ApplePaySession();
      dynamic apple_pay_session_ref01_data = setup['data']['new']['apple_pay_session']['apple_pay_session_ref01'];
      apple_pay_session_ref01_data['account_id'] = setup['idmap']['account01'];

      apple_pay_session_ref01_data = await apple_pay_session_ref01_ent.create(apple_pay_session_ref01_data);
      ok(null != apple_pay_session_ref01_data);


    });
  });
}


Map<String, dynamic> basicSetup([dynamic extra]) {
  final options = <String, dynamic>{};

  final entityDataFile = resolveTestPath(
      '../.sdk/test/entity/apple_pay_session/ApplePaySessionTestData.json');

  final entityDataSource = File(entityDataFile).readAsStringSync();

  final entityData = jsonDecode(entityDataSource);

  options['entity'] = entityData['existing'];

  var client = BluefinPayconexSDK.test(options, extra);
  final struct = client.utility().struct;
  final merge = struct.merge;
  final transform = struct.transform;

  dynamic idmap = transform(
      <dynamic>['apple_pay_session01', 'apple_pay_session02', 'apple_pay_session03', 'account01', 'account02', 'account03'],
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
      Platform.environment['BLUEFIN_PAYCONEX_TEST_APPLE_PAY_SESSION_ENTID'];
  final idmapOverridden =
      null != idmapEnvVal && idmapEnvVal.trim().startsWith('{');

  final env = envOverride({
    'BLUEFIN_PAYCONEX_TEST_APPLE_PAY_SESSION_ENTID': idmap,
    'BLUEFIN_PAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFIN_PAYCONEX_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_PAYCONEX_APIKEY': 'NONE',
  });

  idmap = env['BLUEFIN_PAYCONEX_TEST_APPLE_PAY_SESSION_ENTID'];

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

