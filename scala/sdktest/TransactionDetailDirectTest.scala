// Generated direct-call tests for the transaction_detail entity (mirrors the java
// TestDirect generator). A dependency-free scala-cli test object driven by
// SdkEntityTestMain: an offline mock transport records each call and the
// asserts confirm path-param substitution and the response shape.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}
import java.util.function.{BiFunction, Supplier}

import voxgig.bluefinpayconexsdk.core.{Helpers, BluefinPayconexSDK}

object TransactionDetailDirectTest {

  private class DirectSetup(val client: BluefinPayconexSDK, val calls: JList[JMap[String, Object]])

  private def directSetup(mockres: Object): DirectSetup = {
    val calls = new ArrayList[JMap[String, Object]]()
    val mockdata: Object = if (mockres != null) mockres else SdkTestSupport.om("id" -> "direct01")
    val mockFetch: BiFunction[String, JMap[String, Object], Object] =
      (url, init) => {
        calls.add(SdkTestSupport.om("url" -> url, "init" -> init))
        val js: Supplier[Object] = () => mockdata
        SdkTestSupport.om(
          "status" -> SdkTestSupport.I(200),
          "statusText" -> "OK",
          "headers" -> new LinkedHashMap[String, Object](),
          "json" -> js)
      }
    val client = new BluefinPayconexSDK(SdkTestSupport.om(
      "base" -> "http://localhost:8080",
      "system" -> SdkTestSupport.om("fetch" -> mockFetch)))
    new DirectSetup(client, calls)
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("direct-load-transaction_detail") {
      val setup = directSetup(SdkTestSupport.om("id" -> "direct01"))
      val client = setup.client

      val params = new LinkedHashMap[String, Object]()
      params.put("account_id", "direct01")
      params.put("transaction_id", "direct02")
      val result = client.direct(SdkTestSupport.om(
          "path" -> "api/v4/accounts/{account_id}/payments/{transaction_id}",
          "method" -> "GET",
          "params" -> params))

      rep.eq("direct-load-transaction_detail.ok", java.lang.Boolean.TRUE, result.get("ok"))
      rep.eqI("direct-load-transaction_detail.status", 200, Helpers.toInt(result.get("status")))
      rep.check("direct-load-transaction_detail.data", result.get("data") != null, "expected data to be non-null")
      val dataMap = Helpers.toMapAny(result.get("data"))
      if (dataMap != null) rep.eq("direct-load-transaction_detail.dataId", "direct01", dataMap.get("id"))
      rep.eqI("direct-load-transaction_detail.calls", 1, setup.calls.size())
      val url = setup.calls.get(0).get("url") match { case s: String => s; case _ => "" }
      rep.check("direct-load-transaction_detail.url1", url.contains("direct01"), "expected url to contain direct01, got " + url)
      rep.check("direct-load-transaction_detail.url2", url.contains("direct02"), "expected url to contain direct02, got " + url)
    }
  }
}
