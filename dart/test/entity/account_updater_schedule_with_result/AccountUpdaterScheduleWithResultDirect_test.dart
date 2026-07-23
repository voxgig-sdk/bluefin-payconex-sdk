// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'dart:convert';

import '../../harness.dart';
import '../../utility.dart';

import '../../../lib/BluefinPayconexSDK.dart';

void tests() {
  describe('AccountUpdaterScheduleWithResultDirect', () {
    test('direct-exists', (t) async {
      final sdk = BluefinPayconexSDK({
        'system': {
          'fetch': (dynamic url, dynamic init) async => <String, dynamic>{}
        }
      });
      ok(null != sdk);
    });


    test('direct-list-account_updater_schedule_with_result', (t) async {
      final setup = directSetup([
        {'id': 'direct01'},
        {'id': 'direct02'}
      ]);
      if (maybeSkipControl(
          t, 'direct', 'direct-list-account_updater_schedule_with_result', true == setup['live'])) {
        return;
      }
      if (skipIfMissingIds(t, setup, ["account01","schedule01"])) {
        return;
      }
      final client = setup['client'];
      final calls = setup['calls'];

      final params = <String, dynamic>{};
      final query = <String, dynamic>{};
      if (true == setup['live']) {
        params['account_id'] = setup['idmap']['account01'];
        params['schedule_id'] = setup['idmap']['schedule01'];
      } else {
        params['account_id'] = 'direct01';
        params['schedule_id'] = 'direct02';
      }

      final result = await client.direct({
        'path': 'api/v4/accounts/{account_id}/account-updater/schedules/{schedule_id}/results',
        'method': 'GET',
        'params': params,
        'query': query,
      });

      if (true == setup['live']) {
        // Live mode is lenient: synthetic IDs frequently 4xx and the list-
        // response shape varies wildly across public APIs. Skip rather than
        // fail when the call doesn't return a usable list.
        if (true != result['ok'] ||
            result['status'] < 200 ||
            result['status'] >= 300) {
          return;
        }
        final listArr = unwrapListData(result['data']);
        if (listArr is! List) {
          return;
        }
      } else {
        ok(true == result['ok']);
        ok(200 == result['status']);
        ok(null != result['data']);
        final listArr = unwrapListData(result['data']);
        ok(listArr is List);
        ok(2 == listArr.length);
        ok(1 == calls.length);
        ok('GET' == calls[0]['init']['method']);
        ok(calls[0]['url'].toString().contains('direct01'));
        ok(calls[0]['url'].toString().contains('direct02'));
      }
    });

  });
}


Map<String, dynamic> directSetup([dynamic mockres]) {
  final calls = <Map<String, dynamic>>[];

  final env = envOverride({
    'BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID': <String, dynamic>{},
    'BLUEFINPAYCONEX_TEST_LIVE': 'FALSE',
    'BLUEFINPAYCONEX_APIKEY': 'NONE',
  });

  final live = 'TRUE' == env['BLUEFINPAYCONEX_TEST_LIVE'];

  if (live) {
    final client = BluefinPayconexSDK({
      'apikey': env['BLUEFINPAYCONEX_APIKEY'],
    });

    dynamic idmap = env['BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID'];
    if (idmap is String && idmap.startsWith('{')) {
      idmap = jsonDecode(idmap);
    }

    return {'client': client, 'calls': calls, 'live': live, 'idmap': idmap};
  }

  mockFetch(dynamic url, dynamic init) async {
    calls.add({'url': url, 'init': init});
    return {
      'status': 200,
      'statusText': 'OK',
      'headers': <String, dynamic>{},
      'json': () => mockres ?? {'id': 'direct01'},
    };
  }

  final client = BluefinPayconexSDK({
    'base': 'http://localhost:8080',
    'system': {'fetch': mockFetch},
  });

  return {
    'client': client,
    'calls': calls,
    'live': live,
    'idmap': <String, dynamic>{},
  };
}

// direct() returns the raw response body. List endpoints often wrap the
// array in an envelope (e.g. { data: [...] }, { entities: [...] }). The
// test transforms the raw body to extract the first list — either the body
// itself or the first list property of an envelope map.
dynamic unwrapListData(dynamic data) {
  if (data is List) {
    return data;
  }
  if (data is Map) {
    for (final v in data.values) {
      if (v is List) {
        return v;
      }
    }
  }
  return null;
}
  
