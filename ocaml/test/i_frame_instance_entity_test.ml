(* Generated i_frame_instance entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "i_frame_instance.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.i_frame_instance client Noval in
      check_str "name" ent.e_name "i_frame_instance")

let () =
  test "i_frame_instance.seeded_ops" (fun () ->
      let record = jo [("id", Str "i_frame_instance01")] in
      let seed = jo [("i_frame_instance",
                      jo [("i_frame_instance01", record)])] in
      let client = Sdk_client.test_with (jo [("entity", seed)]) Noval in
      let ent = Sdk_client.i_frame_instance client Noval in
      ignore ent;
      let loaded = ent.e_load (jo [("id", Str "i_frame_instance01")]) Noval in
      check "load is a map" (ismap loaded);
      ())
