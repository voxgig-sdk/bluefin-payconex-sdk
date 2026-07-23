(* Generated payment_iframe entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "payment_iframe.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.payment_iframe client Noval in
      check_str "name" ent.e_name "payment_iframe")
