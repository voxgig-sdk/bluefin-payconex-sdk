(* Generated api_key entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "api_key.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.api_key client Noval in
      check_str "name" ent.e_name "api_key")

let () =
  test "api_key.seeded_ops" (fun () ->
      let record = jo [("id", Str "api_key01")] in
      let seed = jo [("api_key",
                      jo [("api_key01", record)])] in
      let client = Sdk_client.test_with (jo [("entity", seed)]) Noval in
      let ent = Sdk_client.api_key client Noval in
      ignore ent;
      let listed = ent.e_list (empty_map ()) Noval in
      check "list is a list" (islist listed);
      check_int "list size" (size listed) 1;
      let loaded = ent.e_load (jo [("id", Str "api_key01")]) Noval in
      check "load is a map" (ismap loaded);
      check_vstr "load id" (getp loaded "id") "api_key01";
      ())

let () =
  test "api_key.stream" (fun () ->
      let mk_seed () =
        jo [("api_key",
             jo [("S1", jo [("id", Str "S1"); ("name", Str "a")]);
                 ("S2", jo [("id", Str "S2"); ("name", Str "b")]);
                 ("S3", jo [("id", Str "S3"); ("name", Str "c")])])] in
      let has_streaming =
        not (is_nullish (getp (getp (Sdk_config.make_config ()) "feature") "streaming")) in

      (* Fallback (no streaming feature): materialised items. *)
      let client = Sdk_client.test_with (jo [("entity", mk_seed ())]) Noval in
      let ent = Sdk_client.api_key client Noval in
      let items = List.of_seq (ent.e_stream "list" (empty_map ()) Noval) in
      check_int "stream fallback count" (List.length items) 3;
      check "stream yields record maps" (ismap (List.hd items));

      (* signal cancels iteration between yields. *)
      let client2 = Sdk_client.test_with (jo [("entity", mk_seed ())]) Noval in
      let ent2 = Sdk_client.api_key client2 Noval in
      let n = ref 0 in
      let sig_ = vfunc0 (fun () -> incr n; Bool (!n >= 2)) in
      let items2 = List.of_seq (ent2.e_stream "list" (empty_map ()) (jo [("signal", sig_)])) in
      check_int "stream signal stops after first" (List.length items2) 1;

      if has_streaming then begin
        (* Streaming feature active: yields from the streaming iterator. *)
        let sfeat = jo [("feature", jo [("streaming", jo [("active", Bool true)])])] in
        let sclient = Sdk_client.test_with (jo [("entity", mk_seed ())]) sfeat in
        let sent = Sdk_client.api_key sclient Noval in
        check_int "stream (streaming active) count"
          (List.length (List.of_seq (sent.e_stream "list" (empty_map ()) Noval))) 3;

        (* chunkSize groups items into batches: 3 items / 2 -> 2 batches. *)
        let cfeat = jo [("feature", jo [("streaming",
                          jo [("active", Bool true); ("chunkSize", Num 2.)])])] in
        let cclient = Sdk_client.test_with (jo [("entity", mk_seed ())]) cfeat in
        let cent = Sdk_client.api_key cclient Noval in
        check_int "stream chunkSize batch count"
          (List.length (List.of_seq (cent.e_stream "list" (empty_map ()) Noval))) 2
      end)
