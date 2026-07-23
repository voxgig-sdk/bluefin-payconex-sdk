(* Generated i_frame_create_instance entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "i_frame_create_instance.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.i_frame_create_instance client Noval in
      check_str "name" ent.e_name "i_frame_create_instance")
