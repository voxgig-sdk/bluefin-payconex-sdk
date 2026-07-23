(* Generated apple_pay_session entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "apple_pay_session.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.apple_pay_session client Noval in
      check_str "name" ent.e_name "apple_pay_session")
