(* Sintaxe abstrata para a linguagem Orth *)

type program = stmt list

and stmt =
    | Set of string * expr
    | Print of expr

and expr =
    | Cst of int
    | Var of string
    | Binop of expr * expr * binop
    | Letin of expr * expr * string

and binop = Add | Sub | Mul | Div | Mod | Neg | Min | Max