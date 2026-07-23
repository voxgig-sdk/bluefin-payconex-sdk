// Generated basic-flow test for the i_frame_create_instance entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped IFrameCreateInstanceTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object IFrameCreateInstanceEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("i_frame_create_instance.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.iFrameCreateInstance(null)
      rep.check("i_frame_create_instance.instance", ent != null, "expected non-null i_frame_create_instance entity")
    }

    rep.scope("i_frame_create_instance.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/i_frame_create_instance/IFrameCreateInstanceTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("i_frame_create_instance01", "I_FRAME_CREATE_INSTANCE01")
      idmap.put("i_frame_create_instance02", "I_FRAME_CREATE_INSTANCE02")
      idmap.put("i_frame_create_instance03", "I_FRAME_CREATE_INSTANCE03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      idmap.put("payment_iframe01", "PAYMENT_IFRAME01")
      idmap.put("payment_iframe02", "PAYMENT_IFRAME02")
      idmap.put("payment_iframe03", "PAYMENT_IFRAME03")
      val now = System.currentTimeMillis()

      // CREATE
      val iFrameCreateInstanceRef01Ent = client.iFrameCreateInstance(null)
      var iFrameCreateInstanceRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.i_frame_create_instance"), "i_frame_create_instance_ref01"))
      iFrameCreateInstanceRef01Data.put("account_id", idmap.get("account01"))
      iFrameCreateInstanceRef01Data.put("payment_iframe_id", idmap.get("payment_iframe01"))
      val iFrameCreateInstanceRef01DataResult = iFrameCreateInstanceRef01Ent.create(iFrameCreateInstanceRef01Data, null)
      iFrameCreateInstanceRef01Data = Helpers.toMapAny(iFrameCreateInstanceRef01DataResult)
      rep.check("i_frame_create_instance.create.map", iFrameCreateInstanceRef01Data != null, "expected create result to be a map")
    }
  }
}
