// Generated basic-flow test for the iframe entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped IframeTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object IframeEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("iframe.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.iframe(null)
      rep.check("iframe.instance", ent != null, "expected non-null iframe entity")
    }

    rep.scope("iframe.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/iframe/IframeTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("iframe01", "IFRAME01")
      idmap.put("iframe02", "IFRAME02")
      idmap.put("iframe03", "IFRAME03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      idmap.put("payment_iframe01", "PAYMENT_IFRAME01")
      idmap.put("payment_iframe02", "PAYMENT_IFRAME02")
      idmap.put("payment_iframe03", "PAYMENT_IFRAME03")
      idmap.put("account_id", "ACCOUNT01")
      val now = System.currentTimeMillis()

      // CREATE
      val iframeRef01Ent = client.iframe(null)
      var iframeRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.iframe"), "iframe_ref01"))
      iframeRef01Data.put("account_id", idmap.get("account01"))
      val iframeRef01DataResult = iframeRef01Ent.create(iframeRef01Data, null)
      iframeRef01Data = Helpers.toMapAny(iframeRef01DataResult)
      rep.check("iframe.create.map", iframeRef01Data != null, "expected create result to be a map")
      rep.check("iframe.create.id", iframeRef01Data != null && iframeRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val iframeRef01Match = new LinkedHashMap[String, Object]()
      iframeRef01Match.put("account_id", idmap.get("account01"))
      val iframeRef01ListResult = iframeRef01Ent.list(iframeRef01Match, null)
      rep.check("iframe.list.islist", iframeRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + iframeRef01ListResult)
      val iframeRef01List = iframeRef01ListResult.asInstanceOf[JList[Object]]
      val iframeRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(iframeRef01List), SdkTestSupport.om("id" -> iframeRef01Data.get("id")))
      rep.check("iframe.list.exists", !Struct.isempty(iframeRef01ListFound), "expected to find created entity in list")

      // UPDATE
      val iframeRef01DataUp0Up = new LinkedHashMap[String, Object]()
      iframeRef01DataUp0Up.put("id", iframeRef01Data.get("id"))
      iframeRef01DataUp0Up.put("account_id", idmap.get("account_id"))
      val iframeRef01MarkdefUp0Name = "currency"
      val iframeRef01MarkdefUp0Value = "Mark01-iframe_ref01_" + now
      iframeRef01DataUp0Up.put(iframeRef01MarkdefUp0Name, iframeRef01MarkdefUp0Value)
      val iframeRef01ResdataUp0Result = iframeRef01Ent.update(iframeRef01DataUp0Up, null)
      val iframeRef01ResdataUp0 = Helpers.toMapAny(iframeRef01ResdataUp0Result)
      rep.check("iframe.update.map", iframeRef01ResdataUp0 != null, "expected update result to be a map")
      rep.eq("iframe.update.id", iframeRef01DataUp0Up.get("id"), iframeRef01ResdataUp0.get("id"))
      rep.eq("iframe.update.mark", iframeRef01MarkdefUp0Value, iframeRef01ResdataUp0.get(iframeRef01MarkdefUp0Name))

      // LOAD
      val iframeRef01MatchDt0 = new LinkedHashMap[String, Object]()
      iframeRef01MatchDt0.put("id", iframeRef01Data.get("id"))
      val iframeRef01DataDt0Loaded = iframeRef01Ent.load(iframeRef01MatchDt0, null)
      val iframeRef01DataDt0LoadResult = Helpers.toMapAny(iframeRef01DataDt0Loaded)
      rep.check("iframe.load.map", iframeRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("iframe.load.id", iframeRef01Data.get("id"), iframeRef01DataDt0LoadResult.get("id"))
    }
  }
}
