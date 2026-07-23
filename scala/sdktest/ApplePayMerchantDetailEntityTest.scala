// Generated basic-flow test for the apple_pay_merchant_detail entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped ApplePayMerchantDetailTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}
import voxgig.bluefinpayconexsdk.utility.struct.Struct

object ApplePayMerchantDetailEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("apple_pay_merchant_detail.instance") {
      val testsdk = BluefinPayconexSDK.testSDK()
      val ent = testsdk.applePayMerchantDetail(null)
      rep.check("apple_pay_merchant_detail.instance", ent != null, "expected non-null apple_pay_merchant_detail entity")
    }

    rep.scope("apple_pay_merchant_detail.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/apple_pay_merchant_detail/ApplePayMerchantDetailTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinPayconexSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("apple_pay_merchant_detail01", "APPLE_PAY_MERCHANT_DETAIL01")
      idmap.put("apple_pay_merchant_detail02", "APPLE_PAY_MERCHANT_DETAIL02")
      idmap.put("apple_pay_merchant_detail03", "APPLE_PAY_MERCHANT_DETAIL03")
      idmap.put("account01", "ACCOUNT01")
      idmap.put("account02", "ACCOUNT02")
      idmap.put("account03", "ACCOUNT03")
      val now = System.currentTimeMillis()

      // CREATE
      val applePayMerchantDetailRef01Ent = client.applePayMerchantDetail(null)
      var applePayMerchantDetailRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.apple_pay_merchant_detail"), "apple_pay_merchant_detail_ref01"))
      applePayMerchantDetailRef01Data.put("account_id", idmap.get("account01"))
      val applePayMerchantDetailRef01DataResult = applePayMerchantDetailRef01Ent.create(applePayMerchantDetailRef01Data, null)
      applePayMerchantDetailRef01Data = Helpers.toMapAny(applePayMerchantDetailRef01DataResult)
      rep.check("apple_pay_merchant_detail.create.map", applePayMerchantDetailRef01Data != null, "expected create result to be a map")

      // LIST
      val applePayMerchantDetailRef01Match = new LinkedHashMap[String, Object]()
      applePayMerchantDetailRef01Match.put("account_id", idmap.get("account01"))
      val applePayMerchantDetailRef01ListResult = applePayMerchantDetailRef01Ent.list(applePayMerchantDetailRef01Match, null)
      rep.check("apple_pay_merchant_detail.list.islist", applePayMerchantDetailRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + applePayMerchantDetailRef01ListResult)
    }
  }
}
