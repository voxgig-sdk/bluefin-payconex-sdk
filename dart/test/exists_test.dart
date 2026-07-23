import 'harness.dart';

import '../lib/BluefinPayconexSDK.dart';

void tests() {
  describe('exists', () {
    test('test-mode', (t) async {
      final testsdk = BluefinPayconexSDK.test();
      equal(true, null != testsdk);
    });
  });
}
