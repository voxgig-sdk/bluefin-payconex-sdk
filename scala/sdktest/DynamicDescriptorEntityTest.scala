// Generated basic-flow test for the dynamic_descriptor entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DynamicDescriptorTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object DynamicDescriptorEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("dynamic_descriptor.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.dynamicDescriptor(null)
      rep.check("dynamic_descriptor.instance", ent != null, "expected non-null dynamic_descriptor entity")
    }

    rep.scope("dynamic_descriptor.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/dynamic_descriptor/DynamicDescriptorTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("dynamic_descriptor01", "DYNAMIC_DESCRIPTOR01")
      idmap.put("dynamic_descriptor02", "DYNAMIC_DESCRIPTOR02")
      idmap.put("dynamic_descriptor03", "DYNAMIC_DESCRIPTOR03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      idmap.put("account_id", "ACCOUNT01")
      val now = System.currentTimeMillis()

      // CREATE
      val dynamicDescriptorRef01Ent = client.dynamicDescriptor(null)
      var dynamicDescriptorRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.dynamic_descriptor"), "dynamic_descriptor_ref01"))
      dynamicDescriptorRef01Data.put("account_id", idmap.get("account01"))
      val dynamicDescriptorRef01DataResult = dynamicDescriptorRef01Ent.create(dynamicDescriptorRef01Data, null)
      dynamicDescriptorRef01Data = Helpers.toMapAny(dynamicDescriptorRef01DataResult)
      rep.check("dynamic_descriptor.create.map", dynamicDescriptorRef01Data != null, "expected create result to be a map")
      rep.check("dynamic_descriptor.create.id", dynamicDescriptorRef01Data != null && dynamicDescriptorRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val dynamicDescriptorRef01Match = new LinkedHashMap[String, Object]()
      dynamicDescriptorRef01Match.put("account_id", idmap.get("account01"))
      val dynamicDescriptorRef01ListResult = dynamicDescriptorRef01Ent.list(dynamicDescriptorRef01Match, null)
      rep.check("dynamic_descriptor.list.islist", dynamicDescriptorRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + dynamicDescriptorRef01ListResult)
      val dynamicDescriptorRef01List = dynamicDescriptorRef01ListResult.asInstanceOf[JList[Object]]
      val dynamicDescriptorRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(dynamicDescriptorRef01List), SdkTestSupport.om("id" -> dynamicDescriptorRef01Data.get("id")))
      rep.check("dynamic_descriptor.list.exists", !Struct.isempty(dynamicDescriptorRef01ListFound), "expected to find created entity in list")

      // UPDATE
      val dynamicDescriptorRef01DataUp0Up = new LinkedHashMap[String, Object]()
      dynamicDescriptorRef01DataUp0Up.put("id", dynamicDescriptorRef01Data.get("id"))
      dynamicDescriptorRef01DataUp0Up.put("account_id", idmap.get("account_id"))
      val dynamicDescriptorRef01MarkdefUp0Name = "city"
      val dynamicDescriptorRef01MarkdefUp0Value = "Mark01-dynamic_descriptor_ref01_" + now
      dynamicDescriptorRef01DataUp0Up.put(dynamicDescriptorRef01MarkdefUp0Name, dynamicDescriptorRef01MarkdefUp0Value)
      val dynamicDescriptorRef01ResdataUp0Result = dynamicDescriptorRef01Ent.update(dynamicDescriptorRef01DataUp0Up, null)
      val dynamicDescriptorRef01ResdataUp0 = Helpers.toMapAny(dynamicDescriptorRef01ResdataUp0Result)
      rep.check("dynamic_descriptor.update.map", dynamicDescriptorRef01ResdataUp0 != null, "expected update result to be a map")
      rep.eq("dynamic_descriptor.update.id", dynamicDescriptorRef01DataUp0Up.get("id"), dynamicDescriptorRef01ResdataUp0.get("id"))
      rep.eq("dynamic_descriptor.update.mark", dynamicDescriptorRef01MarkdefUp0Value, dynamicDescriptorRef01ResdataUp0.get(dynamicDescriptorRef01MarkdefUp0Name))

      // LOAD
      val dynamicDescriptorRef01MatchDt0 = new LinkedHashMap[String, Object]()
      dynamicDescriptorRef01MatchDt0.put("id", dynamicDescriptorRef01Data.get("id"))
      val dynamicDescriptorRef01DataDt0Loaded = dynamicDescriptorRef01Ent.load(dynamicDescriptorRef01MatchDt0, null)
      val dynamicDescriptorRef01DataDt0LoadResult = Helpers.toMapAny(dynamicDescriptorRef01DataDt0Loaded)
      rep.check("dynamic_descriptor.load.map", dynamicDescriptorRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("dynamic_descriptor.load.id", dynamicDescriptorRef01Data.get("id"), dynamicDescriptorRef01DataDt0LoadResult.get("id"))

      // REMOVE
      val dynamicDescriptorRef01MatchRm0 = new LinkedHashMap[String, Object]()
      dynamicDescriptorRef01MatchRm0.put("id", dynamicDescriptorRef01Data.get("id"))
      dynamicDescriptorRef01Ent.remove(dynamicDescriptorRef01MatchRm0, null)

      // LIST
      val dynamicDescriptorRef01MatchRt0 = new LinkedHashMap[String, Object]()
      dynamicDescriptorRef01MatchRt0.put("account_id", idmap.get("account01"))
      val dynamicDescriptorRef01ListRt0Result = dynamicDescriptorRef01Ent.list(dynamicDescriptorRef01MatchRt0, null)
      rep.check("dynamic_descriptor.list.islist", dynamicDescriptorRef01ListRt0Result.isInstanceOf[JList[?]], "expected list result to be an array, got " + dynamicDescriptorRef01ListRt0Result)
      val dynamicDescriptorRef01ListRt0 = dynamicDescriptorRef01ListRt0Result.asInstanceOf[JList[Object]]
      val dynamicDescriptorRef01ListRt0NotFound = Struct.select(
          SdkTestSupport.entityListToData(dynamicDescriptorRef01ListRt0), SdkTestSupport.om("id" -> dynamicDescriptorRef01Data.get("id")))
      rep.check("dynamic_descriptor.list.notexists", Struct.isempty(dynamicDescriptorRef01ListRt0NotFound), "expected removed entity to not be in list")
    }
  }
}
