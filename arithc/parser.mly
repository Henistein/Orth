
/* parser para  Arith */

%{
  open Ast
%}

%token <int> INT
%token <string> STR
%token <string> IDENT
%token <bool>  BOOL
%token <Ast.command> CMD 
%token <Ast.operation> OPS
%token <Ast.print> PRINT
%token EOF
%token PLUS MINUS TIMES DIV
%token EQ

/* Ponto de entrada da gramática */
%start prog

/* Tipo dos valores devolvidos pelo parser */
%type <Ast.program> prog

%%

prog:
| p = stmts EOF { List.rev p }

stmts:
| i = expr           { [i] }
| l = stmts i = expr { i :: l }
;

(*
stmt:
(*| SET id = IDENT EQ e = expr { Set (id, e) }*)
(*| PRINT e = expr             { Print e }*)
;
*)

expr:
| i  = INT                                     { Int  i }
| s  = STR                                     { Str  s }
| b  = BOOL                                    { Bool b }
| id = IDENT                                   { Str id }
| c  = CMD                                     { Cmd c  }
| o  = OPS                                     { Ops o  }
| prnt = PRINT                                 { Print prnt}
(*
| dp = DUP                                     { Dup dp}
| drp = DROP                                   { Drop drp}
| over = OVER                                  { Over over}
| rot = ROT                                    { Rot rot}
| sp = SWAP                                    { Swap sp}
| e1 = expr o = op e2 = expr                   { Binop (o, e1, e2) }
*)
;

(*
%inline op:
| PLUS  { Add }
| MINUS { Sub }
| TIMES { Mul }
| DIV   { Div }
;
*)



