
(* Produção de código para a linguagem Arith *)

open Format
open X86_64
open Ast

(* Exceção por lançar quando uma variável (local ou global) é mal utilizada *)
exception VarUndef of string

(* Tamanho em byte da frame (cada variável local ocupa 8 bytes) *)
let frame_size = ref 0

(* As variáveis globais estão arquivadas numa HashTable *)
let (genv : (string, unit) Hashtbl.t) = Hashtbl.create 17

(* Utiliza-se  uma tabela associativa cujas chaves são as variáveis locais
   (strings) cujo valor associado é a posição da variável relativamente
   a $fp/%rsb (em bytes)
*)
module StrMap = Map.Make(String)

(* Compilação de uma expressão *)
let compile_expr =
  (* Função recursiva local de compile_expr utilizada para gerar o código
     máquina da árvore de sintaxe  abstracta associada a um valor de tipo
     Ast.expr ; na sequência da execução deste código, o valor deve estar
     no topo da pilha *)
  let rec comprec env next = function
    | Int i ->
        Printf.printf "INT: %d\n" i;
        nop (* POR COMPLETAR *)
    | Bool b ->
        Printf.printf "BOOL: %b\n" b;
        nop (* POR COMPLETAR *)
    | Str s ->
        Printf.printf "STR: %s\n" s;
        nop (* POR COMPLETAR *)
    | Cmd c ->
        Printf.printf "CMD: ";
        begin match c with
          | Dup   -> Printf.printf "DUP";
          | Swap  -> Printf.printf "SWAP";
          | Drop  -> Printf.printf "DROP";
          | Print -> Printf.printf "PRINT";
          | Over  -> Printf.printf "Over";
          | Rot   -> Printf.printf "ROT";
        end;
        Printf.printf "\n";
        nop (* POR COMPLETAR *)
    | Ops o ->
        Printf.printf "OPS: ";
        begin match o with
          | Add   -> Printf.printf "Add";
          | Sub   -> Printf.printf "Sub";
          | Mul   -> Printf.printf "Mul";
          | Div   -> Printf.printf "Div";
          | Equal -> Printf.printf "Equal";
        end;
        Printf.printf "\n";
        nop (* POR COMPLETAR *)
  in
  comprec StrMap.empty 0

(* Compilação de uma instrução *)
(*
let compile_instr = function
  | Set (x, e) ->
      nop (* POR COMPLETAR *)
  | Print e ->
      nop (* POR COMPLETAR *)
*)


(* Compila o programa p e grava o código no ficheiro ofile *)
let compile_program p ofile =
  let code = List.map compile_expr p in
  let code = List.fold_right (++) code nop in
  let p =
    { text =
        globl "main" ++ label "main" ++
        nop  (* POR COMPLETAR *) ++
        code ++
        nop  (* POR COMPLETAR *) ++
        label "print_int" ++
        movq !%rdi !%rsi ++
        leaq (lab ".Sprint_int") rdi ++
        movq (imm 0) !%rax ++
        call "printf" ++
        ret;
      data =
        Hashtbl.fold (fun x _ l -> label x ++ dquad [1] ++ l) genv
          (label ".Sprint_int" ++ string "%d\n")
    }
  in
  let f = open_out ofile in
  let fmt = formatter_of_out_channel f in
  X86_64.print_program fmt p;
  (*  "flush" do buffer para garantir que tudo fica escrito antes do fecho
       deste  *)
  fprintf fmt "@?";
  close_out f
