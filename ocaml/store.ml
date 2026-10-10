(* ----- Immutable Map -----*)

module StringMap = Map.Make(String)
type store = string StringMap.t

(* ----- Empty Store ----- *)

let empty = StringMap.empty

(* ----- Set ----- *)

let set key value store = 
	StringMap.add key value store		(* will not change, make new one*)

(* ----- Get ----- *)

let get key store =
	StringMap.find_opt key store

(* ----- Delete ----- *)
let delete key store =
	StringMap.remove key store

(* ----- Transaction ----- *)

let transaction operation store =		(* Operation changes or tries to*)
    match operation store with
    | Ok new_store -> new_store
    | Error _ -> store

(* ----- Save ----- *)

let save filename store =
    let file = open_out filename in
    StringMap.iter
        (fun key value ->
            Printf.fprintf file "%s=%s\n" key value)
        store;
    close_out file

(* ----- Load ----- *)

let load filename =
    let file = open_in filename in

    let rec read_lines store =
        try
            let line = input_line file in
            match String.split_on_char '=' line with
            | [key; value] ->
                read_lines (set key value store)
            | _ ->
                read_lines store
        with End_of_file ->
            store
    in

    let new_store = read_lines empty in
    close_in file;
    new_store

(* ----- List ----- *)
let list store =
  StringMap.iter
    (fun key value ->
      Printf.printf "%s = %s\n" key value)
    store
