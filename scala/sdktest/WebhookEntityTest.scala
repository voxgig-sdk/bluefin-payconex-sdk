// Generated basic-flow test for the webhook entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped WebhookTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object WebhookEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("webhook.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.webhook(null)
      rep.check("webhook.instance", ent != null, "expected non-null webhook entity")
    }

    rep.scope("webhook.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/webhook/WebhookTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("webhook01", "WEBHOOK01")
      idmap.put("webhook02", "WEBHOOK02")
      idmap.put("webhook03", "WEBHOOK03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      idmap.put("account_id", "ACCOUNT01")
      val now = System.currentTimeMillis()

      // CREATE
      val webhookRef01Ent = client.webhook(null)
      var webhookRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.webhook"), "webhook_ref01"))
      webhookRef01Data.put("account_id", idmap.get("account01"))
      val webhookRef01DataResult = webhookRef01Ent.create(webhookRef01Data, null)
      webhookRef01Data = Helpers.toMapAny(webhookRef01DataResult)
      rep.check("webhook.create.map", webhookRef01Data != null, "expected create result to be a map")
      rep.check("webhook.create.id", webhookRef01Data != null && webhookRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val webhookRef01Match = new LinkedHashMap[String, Object]()
      webhookRef01Match.put("account_id", idmap.get("account01"))
      val webhookRef01ListResult = webhookRef01Ent.list(webhookRef01Match, null)
      rep.check("webhook.list.islist", webhookRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + webhookRef01ListResult)
      val webhookRef01List = webhookRef01ListResult.asInstanceOf[JList[Object]]
      val webhookRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(webhookRef01List), SdkTestSupport.om("id" -> webhookRef01Data.get("id")))
      rep.check("webhook.list.exists", !Struct.isempty(webhookRef01ListFound), "expected to find created entity in list")

      // UPDATE
      val webhookRef01DataUp0Up = new LinkedHashMap[String, Object]()
      webhookRef01DataUp0Up.put("id", webhookRef01Data.get("id"))
      webhookRef01DataUp0Up.put("account_id", idmap.get("account_id"))
      val webhookRef01MarkdefUp0Name = "event"
      val webhookRef01MarkdefUp0Value = "Mark01-webhook_ref01_" + now
      webhookRef01DataUp0Up.put(webhookRef01MarkdefUp0Name, webhookRef01MarkdefUp0Value)
      val webhookRef01ResdataUp0Result = webhookRef01Ent.update(webhookRef01DataUp0Up, null)
      val webhookRef01ResdataUp0 = Helpers.toMapAny(webhookRef01ResdataUp0Result)
      rep.check("webhook.update.map", webhookRef01ResdataUp0 != null, "expected update result to be a map")
      rep.eq("webhook.update.id", webhookRef01DataUp0Up.get("id"), webhookRef01ResdataUp0.get("id"))
      rep.eq("webhook.update.mark", webhookRef01MarkdefUp0Value, webhookRef01ResdataUp0.get(webhookRef01MarkdefUp0Name))

      // LOAD
      val webhookRef01MatchDt0 = new LinkedHashMap[String, Object]()
      webhookRef01MatchDt0.put("id", webhookRef01Data.get("id"))
      val webhookRef01DataDt0Loaded = webhookRef01Ent.load(webhookRef01MatchDt0, null)
      val webhookRef01DataDt0LoadResult = Helpers.toMapAny(webhookRef01DataDt0Loaded)
      rep.check("webhook.load.map", webhookRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("webhook.load.id", webhookRef01Data.get("id"), webhookRef01DataDt0LoadResult.get("id"))

      // REMOVE
      val webhookRef01MatchRm0 = new LinkedHashMap[String, Object]()
      webhookRef01MatchRm0.put("id", webhookRef01Data.get("id"))
      webhookRef01Ent.remove(webhookRef01MatchRm0, null)

      // LIST
      val webhookRef01MatchRt0 = new LinkedHashMap[String, Object]()
      webhookRef01MatchRt0.put("account_id", idmap.get("account01"))
      val webhookRef01ListRt0Result = webhookRef01Ent.list(webhookRef01MatchRt0, null)
      rep.check("webhook.list.islist", webhookRef01ListRt0Result.isInstanceOf[JList[?]], "expected list result to be an array, got " + webhookRef01ListRt0Result)
      val webhookRef01ListRt0 = webhookRef01ListRt0Result.asInstanceOf[JList[Object]]
      val webhookRef01ListRt0NotFound = Struct.select(
          SdkTestSupport.entityListToData(webhookRef01ListRt0), SdkTestSupport.om("id" -> webhookRef01Data.get("id")))
      rep.check("webhook.list.notexists", Struct.isempty(webhookRef01ListRt0NotFound), "expected removed entity to not be in list")
    }
  }
}
