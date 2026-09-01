(* ====================================== *)
(* Question 1: OCaml Pattern Matching     *)
(* ====================================== *)

type 'a rose =
  | Node of 'a * 'a rose list


(* ----- size ----- *)

let rec size (Node (_, children)) =
  1 + List.fold_left
        (fun total child -> total + size child)
        0
        children


(* ----- map ----- *)

let rec map f (Node (value, children)) =
  Node (f value, List.map (map f) children)


(* ----- fold ----- *)

let rec fold f (Node (value, children)) =
  f value (List.map (fold f) children)

