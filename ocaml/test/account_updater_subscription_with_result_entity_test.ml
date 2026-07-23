(* Generated account_updater_subscription_with_result entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "account_updater_subscription_with_result.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.account_updater_subscription_with_result client Noval in
      check_str "name" ent.e_name "account_updater_subscription_with_result")

let () =
  test "account_updater_subscription_with_result.seeded_ops" (fun () ->
      let record = jo [("id", Str "account_updater_subscription_with_result01")] in
      let seed = jo [("account_updater_subscription_with_result",
                      jo [("account_updater_subscription_with_result01", record)])] in
      let client = Sdk_client.test_with (jo [("entity", seed)]) Noval in
      let ent = Sdk_client.account_updater_subscription_with_result client Noval in
      ignore ent;
      let loaded = ent.e_load (jo [("id", Str "account_updater_subscription_with_result01")]) Noval in
      check "load is a map" (ismap loaded);
      check_vstr "load id" (getp loaded "id") "account_updater_subscription_with_result01";
      ())
