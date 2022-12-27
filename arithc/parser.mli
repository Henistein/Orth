
(* The type of tokens. *)

type token = 
  | TIMES
  | SWAP
  | STR of (string)
  | ROT
  | PRINT
  | PLUS
  | OVER
  | MINUS
  | INT of (int)
  | IDENT of (string)
  | EQ
  | EOF
  | DUP
  | DROP
  | DIV
  | BOOL of (bool)

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)
