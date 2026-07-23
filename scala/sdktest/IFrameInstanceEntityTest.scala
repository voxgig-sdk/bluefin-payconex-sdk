// Generated basic-flow test for the i_frame_instance entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped IFrameInstanceTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object IFrameInstanceEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("i_frame_instance.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.iFrameInstance(null)
      rep.check("i_frame_instance.instance", ent != null, "expected non-null i_frame_instance entity")
    }

    rep.scope("i_frame_instance.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/i_frame_instance/IFrameInstanceTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("i_frame_instance01", "I_FRAME_INSTANCE01")
      idmap.put("i_frame_instance02", "I_FRAME_INSTANCE02")
      idmap.put("i_frame_instance03", "I_FRAME_INSTANCE03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      idmap.put("payment_iframe01", "PAYMENT_IFRAME01")
      idmap.put("payment_iframe02", "PAYMENT_IFRAME02")
      idmap.put("payment_iframe03", "PAYMENT_IFRAME03")
      val now = System.currentTimeMillis()

      // LOAD
      val iFrameInstanceRef01Ent = client.iFrameInstance(null)
      val iFrameInstanceRef01MatchDt0 = new LinkedHashMap[String, Object]()
      val iFrameInstanceRef01DataDt0Loaded = iFrameInstanceRef01Ent.load(iFrameInstanceRef01MatchDt0, null)
      rep.check("i_frame_instance.load.nonnull", iFrameInstanceRef01DataDt0Loaded != null, "expected load result to be non-null")
    }
  }
}
