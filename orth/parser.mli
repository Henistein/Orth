
(* The type of tokens. *)

type token = 
  | WHILE
  | STR of (string)
  | PROC
  | PRINT of (Ast.print)
  | OPS of (Ast.operation)
  | LET
  | INT of (int)
  | IN
  | IF
  | IDENT of (string)
  | FETCH
  | EOF
  | END
  | ELSE
  | CMD of (Ast.command)
  | BOOL of (bool)
  | ATR

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)
