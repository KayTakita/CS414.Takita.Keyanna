(* ----- Transactional Key Value Store ----- *)

open Store

(* ----- Command Loop ----- *)
let rec loop current_store =
  print_string "... ";
  flush stdout;

  let input = read_line () in
  let parts = String.split_on_char ' ' input in

  match parts with
  | ["Quit"] ->
      print_endline "Thank you, Goodbye"

  | ["Set"; key; value] ->
      let new_store = set key value current_store in
      Printf.printf "saved: %s = %s\n" key value;
      loop new_store

  | ["Get"; key] ->
      (match get key current_store with
       | Some value -> print_endline value
       | None -> print_endline "... key not found");
      loop current_store

  | ["Delete"; key] ->
      let new_store = delete key current_store in
      Printf.printf "Delete: %s\n" key;
      loop new_store

  | ["List"] ->
      print_endline "Store:";
      list current_store;
      loop current_store

  | _ ->
      print_endline "Error, invalid command";
      loop current_store

(* ----- Transaction Test ----- *)

let transaction_test () =
    let original = empty in

    let successful_operation store =
        let new_store = set "name" "Ada" store in
        Ok new_store
    in

    let failed_operation store =
        Error "Transaction failed"
    in

    let success_store = transaction successful_operation original in
    print_endline "Successful Transaction:";
    list success_store;

    let failed_store = transaction failed_operation original in
    print_endline "Failed Transaction:";
    list failed_store

(* ----- Main ----- *)
let () =
  transaction_test ();
  print_endline "Transactional key value store";
  print_endline "Please enter a command:";
  loop empty
