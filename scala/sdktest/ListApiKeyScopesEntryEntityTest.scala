// Generated basic-flow test for the list_api_key_scopes_entry entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped ListApiKeyScopesEntryTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object ListApiKeyScopesEntryEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("list_api_key_scopes_entry.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.listApiKeyScopesEntry(null)
      rep.check("list_api_key_scopes_entry.instance", ent != null, "expected non-null list_api_key_scopes_entry entity")
    }

    rep.scope("list_api_key_scopes_entry.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/list_api_key_scopes_entry/ListApiKeyScopesEntryTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("list_api_key_scopes_entry01", "LIST_API_KEY_SCOPES_ENTRY01")
      idmap.put("list_api_key_scopes_entry02", "LIST_API_KEY_SCOPES_ENTRY02")
      idmap.put("list_api_key_scopes_entry03", "LIST_API_KEY_SCOPES_ENTRY03")
      val now = System.currentTimeMillis()

      // LIST
      val listApiKeyScopesEntryRef01Ent = client.listApiKeyScopesEntry(null)
      val listApiKeyScopesEntryRef01Match = new LinkedHashMap[String, Object]()
      val listApiKeyScopesEntryRef01ListResult = listApiKeyScopesEntryRef01Ent.list(listApiKeyScopesEntryRef01Match, null)
      rep.check("list_api_key_scopes_entry.list.islist", listApiKeyScopesEntryRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + listApiKeyScopesEntryRef01ListResult)
    }
  }
}
