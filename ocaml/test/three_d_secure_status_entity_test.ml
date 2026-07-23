(* Generated three_d_secure_status entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "three_d_secure_status.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.three_d_secure_status client Noval in
      check_str "name" ent.e_name "three_d_secure_status")

let () =
  test "three_d_secure_status.seeded_ops" (fun () ->
      let record = jo [("id", Str "three_d_secure_status01")] in
      let seed = jo [("three_d_secure_status",
                      jo [("three_d_secure_status01", record)])] in
      let client = Sdk_client.test_with (jo [("entity", seed)]) Noval in
      let ent = Sdk_client.three_d_secure_status client Noval in
      ignore ent;
      let loaded = ent.e_load (jo [("id", Str "three_d_secure_status01")]) Noval in
      check "load is a map" (ismap loaded);
      ())
