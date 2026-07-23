(* Generated transaction_detail entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "transaction_detail.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.transaction_detail client Noval in
      check_str "name" ent.e_name "transaction_detail")

let () =
  test "transaction_detail.seeded_ops" (fun () ->
      let record = jo [("id", Str "transaction_detail01")] in
      let seed = jo [("transaction_detail",
                      jo [("transaction_detail01", record)])] in
      let client = Sdk_client.test_with (jo [("entity", seed)]) Noval in
      let ent = Sdk_client.transaction_detail client Noval in
      ignore ent;
      let loaded = ent.e_load (jo [("id", Str "transaction_detail01")]) Noval in
      check "load is a map" (ismap loaded);
      check_vstr "load id" (getp loaded "id") "transaction_detail01";
      ())
