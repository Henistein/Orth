
(* Sintaxe abstracta para a linguagem Arith *)

type program = expr list

and expr =
  | Int of int
  | Str of string
  | Bool of bool
  | Ident of string
  | Ops of operation 
  | Cmd of command
  | Print of print
  | Ifelse of expr list * expr list
  | Ifthen of expr list
  | While of expr list * expr list
  | Proc of string * expr list
  | Let of string * expr 
  | Fetch of string
  (*| Set of string * expr*)

and command = Dup | Swap | Drop | Over | Rot 

and operation = Add | Sub  | Mul | Div | Mod | Min | Max | (*Arithmetic*)
               Equal | Diff | Gt  | Lt  | Ge  | Le  | Neg | And | Or  (*Comparison*)

and print = Printi | Printb | Prints
