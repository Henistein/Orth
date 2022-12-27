
(* The type of tokens. *)

type token = 
  | TIMES
  | STR of (string)
  | PLUS
  | OPS of (Ast.operation)
  | MINUS
  | INT of (int)
  | IDENT of (string)
  | EQ
  | EOF
  | DIV
  | CMD of (Ast.command)
  | BOOL of (bool)

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)
