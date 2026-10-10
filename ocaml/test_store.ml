open Store

let () =
  (* ----- SET TEST ----- *)
  print_endline "----- SET TEST -----";
  let store1 = set "name" "Ada" empty in
  (match get "name" store1 with
   | Some value -> Printf.printf "name = %s\n" value
   | None -> print_endline "name not found");

  (* ----- GET TEST ----- *)
  print_endline "\n----- GET TEST -----";
  (match get "name" store1 with
   | Some value -> Printf.printf "name = %s\n" value
   | None -> print_endline "name not found");

  (* ----- DELETE TEST ----- *)
  print_endline "\n----- DELETE TEST -----";
  let store2 = delete "name" store1 in
  (match get "name" store2 with
   | Some value -> Printf.printf "name = %s\n" value
   | None -> print_endline "name not found");

  (* ----- TRANSACTION ROLLBACK TEST ----- *)
  print_endline "\n----- TRANSACTION ROLLBACK TEST -----";

  let original = set "x" "10" empty in

  print_endline "Initial state:";
  list original;

  let failed_operation store =
    let modified =
      store
      |> set "x" "20"
      |> set "y" "30"
    in
    print_endline "\nInside transaction:";
    list modified;

    Error "Abort transaction"
  in

  let final_store = transaction failed_operation original in

  print_endline "\nAfter aborted transaction:";
  list final_store;

  (* ----- SAVE TEST ----- *)
  print_endline "\n----- SAVE TEST -----";
  save "test_data.txt" final_store;
  print_endline "Store saved.";

  (* ----- LOAD TEST ----- *)
  print_endline "\n----- LOAD TEST -----";
  let loaded_store = load "test_data.txt" in
  print_endline "Loaded store:";
  list loaded_store
