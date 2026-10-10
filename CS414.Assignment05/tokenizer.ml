(* CS414 Assignment05 *)
(* Question 2: Extended Tokenizer for the command set *)

(* Type of tokens from other set *)

type token =
	| LS
	| CD
	| CAT
	| PRINT
	| EXEC
	| SET
	| ECHO
	| EQUALS
	| PLUS
	| MINUS
	| TIMES
	| DIVIDE
	| LPAREN
	| RPAREN
	| VARIABLE of string
	| VALUE of string
	| FILENAME of string
	| PATH of string

let token_string token =
	match token with
	| LS -> "LS"
	| CD -> "CD"
	| CAT -> "CAT"
	| PRINT -> "PRINT"
	| EXEC -> "EXEC"
	| EQUALS -> "EQUALS"
	| SET -> "SET"
	| ECHO -> "ECHO"
	| PLUS -> "PLUS"
	| MINUS -> "MINUS"
	| TIMES -> "TIMES"
	| DIVIDE -> "DIVIDE"
	| LPAREN -> "LPAREN"
	| RPAREN -> "RPAREN"
	| VARIABLE name -> "VARIABLE " ^ name
	| VALUE value -> "VALUE " ^ value
	| FILENAME name -> "FILENAME " ^ name
	| PATH path -> "PATH " ^ path

let token_words word =
	match word with
	| "ls" -> LS
	| "cd" -> CD
	| "set" -> SET
	| "echo" -> ECHO
	| "cat" -> CAT
	| "print" -> PRINT
	| "exec" -> EXEC
	| "=" -> EQUALS
	| "+" -> PLUS
	| "-" -> MINUS
	| "*" -> TIMES
	| "/" -> DIVIDE
	| "(" -> LPAREN
	| ")" -> RPAREN
	| word when String.length word > 0 && word.[0] = '$' -> VARIABLE word
	| word when int_of_string_opt word <> None -> VALUE word
	| word -> FILENAME word

(* Program *)
let () =
	print_string "enter command: ";
	let input = read_line () in
	let words = String.split_on_char ' ' input in
	let tokens = List.map token_words words in

	print_endline "\nTokens:";
	List.iter (fun token -> print_endline (token_string token)) tokens	
	
