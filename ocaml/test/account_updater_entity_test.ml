(* Generated account_updater entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "account_updater.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.account_updater client Noval in
      check_str "name" ent.e_name "account_updater")
