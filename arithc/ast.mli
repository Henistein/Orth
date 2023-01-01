
(* Sintaxe abstracta para a linguagem Arith *)

type program = expr list

and expr =
  | Int of int
  | Str of string
  | Bool of bool
  (*| Binop of binop * expr * expr*)
  (*| Unop of unop * expr*)
  | Ops of operation 
  | Cmd of command
  | Print of print
  | If of expr list * expr list
  | While of expr * expr list

and command = Dup | Swap | Drop | Over | Rot 

and operation = Add | Sub  | Mul | Div | Mod | Min | Max | (*Arithmetic*)
               Equal | Diff | Gt  | Lt  | Ge  | Le  | Neg   (*Comparison*)

and print = Printi | Printb | Prints