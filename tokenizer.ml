(* CS414 Assignment03 *)
(* Step 2: Write a Tokenizer for the command set *)

(* Type of tokens from other set *)

Token Types =
	| LS
	| CD
	| CAT
	| PRINT
	| EXEC
	| FILENAME of string
	| PATH of string

let token_string =
	match token with
	| LS -> "LS"
	| CD -> "CD"
	| CAT -> "CAT"
	| PRINT -> "PRINT"
	| EXEC -> "EXEC"
	| FILENAME -> "FILENAME"
	| PATH -> "PATH"

let token_words word =
	| "ls" -> LS
	| "cd" -> CD
	| "cat" -> CAT
	| "print" -> PRINT
	| "exec" -> EXEC

(* Program *)
let () =
	print_string "enter command: ";
	
	print_endline "\nTokens:";
	
	
