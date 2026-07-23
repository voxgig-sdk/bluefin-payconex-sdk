// Generated basic-flow test for the api_key entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped ApiKeyTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object ApiKeyEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("api_key.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.apiKey(null)
      rep.check("api_key.instance", ent != null, "expected non-null api_key entity")
    }

    rep.scope("api_key.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/api_key/ApiKeyTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("api_key01", "API_KEY01")
      idmap.put("api_key02", "API_KEY02")
      idmap.put("api_key03", "API_KEY03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      idmap.put("account_id", "ACCOUNT01")
      val now = System.currentTimeMillis()

      // CREATE
      val apiKeyRef01Ent = client.apiKey(null)
      var apiKeyRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.api_key"), "api_key_ref01"))
      apiKeyRef01Data.put("account_id", idmap.get("account01"))
      val apiKeyRef01DataResult = apiKeyRef01Ent.create(apiKeyRef01Data, null)
      apiKeyRef01Data = Helpers.toMapAny(apiKeyRef01DataResult)
      rep.check("api_key.create.map", apiKeyRef01Data != null, "expected create result to be a map")
      rep.check("api_key.create.id", apiKeyRef01Data != null && apiKeyRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val apiKeyRef01Match = new LinkedHashMap[String, Object]()
      apiKeyRef01Match.put("account_id", idmap.get("account01"))
      val apiKeyRef01ListResult = apiKeyRef01Ent.list(apiKeyRef01Match, null)
      rep.check("api_key.list.islist", apiKeyRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + apiKeyRef01ListResult)
      val apiKeyRef01List = apiKeyRef01ListResult.asInstanceOf[JList[Object]]
      val apiKeyRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(apiKeyRef01List), SdkTestSupport.om("id" -> apiKeyRef01Data.get("id")))
      rep.check("api_key.list.exists", !Struct.isempty(apiKeyRef01ListFound), "expected to find created entity in list")

      // UPDATE
      val apiKeyRef01DataUp0Up = new LinkedHashMap[String, Object]()
      apiKeyRef01DataUp0Up.put("id", apiKeyRef01Data.get("id"))
      apiKeyRef01DataUp0Up.put("account_id", idmap.get("account_id"))
      val apiKeyRef01MarkdefUp0Name = "expires_at"
      val apiKeyRef01MarkdefUp0Value = "Mark01-api_key_ref01_" + now
      apiKeyRef01DataUp0Up.put(apiKeyRef01MarkdefUp0Name, apiKeyRef01MarkdefUp0Value)
      val apiKeyRef01ResdataUp0Result = apiKeyRef01Ent.update(apiKeyRef01DataUp0Up, null)
      val apiKeyRef01ResdataUp0 = Helpers.toMapAny(apiKeyRef01ResdataUp0Result)
      rep.check("api_key.update.map", apiKeyRef01ResdataUp0 != null, "expected update result to be a map")
      rep.eq("api_key.update.id", apiKeyRef01DataUp0Up.get("id"), apiKeyRef01ResdataUp0.get("id"))
      rep.eq("api_key.update.mark", apiKeyRef01MarkdefUp0Value, apiKeyRef01ResdataUp0.get(apiKeyRef01MarkdefUp0Name))

      // LOAD
      val apiKeyRef01MatchDt0 = new LinkedHashMap[String, Object]()
      apiKeyRef01MatchDt0.put("id", apiKeyRef01Data.get("id"))
      val apiKeyRef01DataDt0Loaded = apiKeyRef01Ent.load(apiKeyRef01MatchDt0, null)
      val apiKeyRef01DataDt0LoadResult = Helpers.toMapAny(apiKeyRef01DataDt0Loaded)
      rep.check("api_key.load.map", apiKeyRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("api_key.load.id", apiKeyRef01Data.get("id"), apiKeyRef01DataDt0LoadResult.get("id"))

      // REMOVE
      val apiKeyRef01MatchRm0 = new LinkedHashMap[String, Object]()
      apiKeyRef01MatchRm0.put("id", apiKeyRef01Data.get("id"))
      apiKeyRef01Ent.remove(apiKeyRef01MatchRm0, null)

      // LIST
      val apiKeyRef01MatchRt0 = new LinkedHashMap[String, Object]()
      apiKeyRef01MatchRt0.put("account_id", idmap.get("account01"))
      val apiKeyRef01ListRt0Result = apiKeyRef01Ent.list(apiKeyRef01MatchRt0, null)
      rep.check("api_key.list.islist", apiKeyRef01ListRt0Result.isInstanceOf[JList[?]], "expected list result to be an array, got " + apiKeyRef01ListRt0Result)
      val apiKeyRef01ListRt0 = apiKeyRef01ListRt0Result.asInstanceOf[JList[Object]]
      val apiKeyRef01ListRt0NotFound = Struct.select(
          SdkTestSupport.entityListToData(apiKeyRef01ListRt0), SdkTestSupport.om("id" -> apiKeyRef01Data.get("id")))
      rep.check("api_key.list.notexists", Struct.isempty(apiKeyRef01ListRt0NotFound), "expected removed entity to not be in list")
    }
  }
}
