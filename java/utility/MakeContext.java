package voxgig.bluefinpayconexsdk.utility;

import java.util.Map;

import voxgig.bluefinpayconexsdk.core.Context;

final class MakeContext {

  private MakeContext() {}

  static Context makeContext(Map<String, Object> ctxmap, Context basectx) {
    return new Context(ctxmap, basectx);
  }
}
