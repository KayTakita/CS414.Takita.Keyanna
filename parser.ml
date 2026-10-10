(* CS414 Assignment03 *)
(* Step 3: Write a Parser for the command set *)

type token =
	| LS
	| CD
	| CAT
	| PRINT
	| EXEC
	| FILENAME of string
	| PATH of string

(* if you see this... i hate command line *)

(* abstract Sybatx Tree *)

type ast =
	| LsCommand of string 
	| CdCommand of string
	| CatCommand of string
	| PrintCommand of string
	| ExecCommand of string

		(* google *)
let parse tokens = 
	match tokens with 

	|[LS] -> LsCommand None
	| [LS; FILENAME name] -> LsCommand (some name)

	| [CD] -> CdCommand None
	| [CD; PATH path] -> CdCommand (some path)

	| [CAT; FILENAME name] -> CatCommand name
	
	| [PRINT; FILENAME name] -> PrintCommand name

	| [EXEC; FILENAME name] -> ExecCommand name

let print_AST tree=
	match tree with

	| LsCommand none -> print_endline "LsCommand"
	
	|CdCommand None -> print_endline "CdCommand"
	
	| CatCommand name -> print_endline "CatCommand"

	| PrintCommand name -> print_endline "PrintCommand"

	| ExecCommand name -> print_endline "ExecCommand"
