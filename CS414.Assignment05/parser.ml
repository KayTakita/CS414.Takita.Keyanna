(* CS414 Assignment05 *)
(* Question 2: Extended Parser for the command set *)

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

(* if you see this... i hate command line *)

(* abstract Sybatx Tree *)

type ast =
	| LsCommand of string option
	| CdCommand of string option
	| CatCommand of string
	| PrintCommand of string
	| ExecCommand of string
	| SetCommand of string * string
	| EchoCommand of string

		(* google *)
(* ----- Symbol Table ----- *)
let symbol_table = Hashtbl.create 10

let set_variable name value = Hashtbl.replace symbol_table name value

let print_symbol_table () = 
	print_endline "symbol Table";
	Hashtbl.iter
		(fun name value -> Printf.printf "%s = %s\n" name value) symbol_table

let parse tokens = 
	match tokens with 

	|[LS] -> LsCommand None
	| [LS; FILENAME name] -> LsCommand (Some name)

	| [CD] -> CdCommand None
	| [CD; PATH path] -> CdCommand (Some path)

	| [CAT; FILENAME name] -> CatCommand name
	
	| [PRINT; FILENAME name] -> PrintCommand name

	| [EXEC; FILENAME name] -> ExecCommand name
	
	| [SET; VARIABLE name; EQUALS; VALUE value] -> SetCommand (name, value)
	
	| [SET; VARIABLE name; EQUALS; VALUE v1; PLUS; VALUE v2] -> 
		SetCommand (name, v1 ^ " + " ^ v2)
	
	| [SET; VARIABLE name; EQUALS; VALUE v1; MINUS; VALUE v2] ->
		SetCommand (name, v1 ^ " - " ^ v2)
	
	| [SET; VARIABLE name; EQUALS; VALUE v1; TIMES; VALUE v2] ->
    		SetCommand (name, v1 ^ " * " ^ v2)

	| [SET; VARIABLE name; EQUALS; VALUE v1; DIVIDE; VALUE v2] ->
		SetCommand (name, v1 ^ " / " ^ v2)

	| [ECHO; VARIABLE name] -> EchoCommand name

	| _ -> failwith "invalid command"

let print_AST tree =
	match tree with

	| LsCommand none -> print_endline "LsCommand"
	
	| CdCommand None -> print_endline "CdCommand"

	| CdCommand (Some path) -> print_endline "CdCommand"
	
	| CatCommand name -> print_endline "CatCommand"

	| PrintCommand name -> print_endline "PrintCommand"

	| ExecCommand name -> print_endline "ExecCommand"

	| SetCommand (name, value) -> print_endline "SetCommand"

	| EchoCommand name -> print_endline "EchoCommand"

(* ----- Test Parser ----- *)
let () =
    let tree = parse [SET; VARIABLE "$total"; EQUALS; VALUE "5"; PLUS; VALUE "3"] in
    print_AST tree;
    set_variable "$total" "5 + 3";
    print_symbol_table ();

let echo_tree = parse [ECHO; VARIABLE "$total"] in
print_AST echo_tree
