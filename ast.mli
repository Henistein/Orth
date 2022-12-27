(* Sintaxe abstrata para a linguagem Orth *)

type program = stmt list

and stmt =
    | Set of string * expr
    | Print of expr

and expr =
    | Cst of int
    | Var of string
    | Unop of expr * unop
    | Binop of expr * expr * binop
    | Letin of expr * expr * string

and unop = Neg

and binop = Add | Sub | Mul | Div | Mod | Min | Max