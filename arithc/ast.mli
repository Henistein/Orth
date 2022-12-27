
(* Sintaxe abstracta para a linguagem Arith *)

type program = expr list

and expr =
  | Int of int
  | Str of string
  | Bool of bool
  | Binop of binop * expr * expr
  | Unop of unop * expr
  | Cmd of command

and command = Dup | Swap | Drop | Print | Over | Rot

and binop = Add | Sub  | Mul | Div | Mod | Min | Max | (*Arithmetic*)
          Equal | Diff | Gt  | Lt  | Ge  | Le          (*Comparison*)

and unop = Neg