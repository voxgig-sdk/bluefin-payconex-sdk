(* Generated three_d_secure_browser_init entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "three_d_secure_browser_init.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.three_d_secure_browser_init client Noval in
      check_str "name" ent.e_name "three_d_secure_browser_init")
