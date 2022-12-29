
(* Produção de código para a linguagem Arith *)

open Format
open X86_64
open Ast

(* Exceção por lançar quando uma variável (local ou global) é mal utilizada *)
exception VarUndef of string

(* As variáveis globais estão arquivadas numa HashTable *)
let (genv : (string, unit) Hashtbl.t) = Hashtbl.create 17

(* Utiliza-se  uma tabela associativa cujas chaves são as variáveis locais
   (strings) cujo valor associado é a posição da variável relativamente
   a $fp/%rsb (em bytes)
*)
module StrMap = Map.Make(String)

let compile_print = function
  | Printi -> 
    Printf.printf "PRINTI\n";
    popq rdi ++
    call "print_int"

  | Printb -> 
    Printf.printf "PRINTB\n";
    popq rdi ++
    call "print_bool"

let compile_cmds = function
  | Dup   -> 
    Printf.printf "DUP\n"; 
    popq rdi ++
    pushq !%rdi ++
    pushq !%rdi

  | Swap  -> 
    Printf.printf "SWAP\n";
    popq rdi ++
    popq rsi ++
    pushq !%rdi ++
    pushq !%rsi 

  | Drop  -> 
    Printf.printf "DROP\n";
    popq rdi

  | Over  -> 
    Printf.printf "Over\n";
    popq rdi ++
    popq rsi ++
    pushq !%rsi ++
    pushq !%rdi ++
    pushq !%rsi

  | Rot   -> 
    Printf.printf "ROT\n";
    popq rdi ++ 
    popq rsi ++ 
    popq rcx ++ 
    pushq !%rsi ++ 
    pushq !%rdi ++ 
    pushq !%rcx    

let compile_ops = function
  | Add   -> Printf.printf "Add\n"; 
             popq rbx ++
             popq rax ++
             addq !%rbx !%rax ++
             pushq !%rax
  | Sub   -> Printf.printf "Sub\n"; 
             popq rbx ++
             popq rax ++
             subq !%rbx !%rax ++
             pushq !%rax
  | Mul   -> Printf.printf "Mul\n"; 
             popq rbx ++
             popq rax ++
             imulq !%rbx !%rax ++
             pushq !%rax 
  | Div   -> Printf.printf "Div\n"; 
             popq rdi ++ 
             popq rax ++ 
             movq (imm 0) !%rdx ++ 
             idivq !%rdi ++ 
             pushq !%rax
  | Equal -> Printf.printf "Equal\n"; nop

(* Compilação de uma expressão *)
let compile_expr =
  (* Função recursiva local de compile_expr utilizada para gerar o código
     máquina da árvore de sintaxe  abstracta associada a um valor de tipo
     Ast.expr ; na sequência da execução deste código, o valor deve estar
     no topo da pilha *)
  let rec comprec env next = function
    | Int i ->
        Printf.printf "INT: %d\n" i;
        pushq (imm i)
    | Bool b ->
        Printf.printf "BOOL: %b\n" b;
        if b then pushq (imm 1) else pushq (imm 0) 
    | Str s ->
        Printf.printf "STR: %s\n" s;
        nop (* POR COMPLETAR *)
    | Cmd c ->
        Printf.printf "CMD: ";
        compile_cmds c;
    | Ops o ->
        Printf.printf "OPS: ";
        compile_ops o;
    | Print p ->
        Printf.printf "PRINT: ";
        compile_print p;
  in
  comprec StrMap.empty 0


(* Compila o programa p e grava o código no ficheiro ofile *)
let compile_program p ofile =
  let code = List.map compile_expr p in
  let code = List.fold_right (++) code nop in
  let p =
    { text =
        globl "main" ++ label "main" ++
        code ++
        movq (imm 0) !%rax ++ (* exit *)
        ret ++

        (* print_int *)
        label "print_int" ++
        movq !%rdi !%rsi ++
        leaq (lab ".Sprint_int") rdi ++
        movq (imm 0) !%rax ++
        call "printf" ++
        ret ++
        (* print_bool *)
        label  "print_bool"  ++
        cmpq (imm 0) !%rdi   ++
        je   ".Lfalse"       ++
        movq (ilab "true") !%rdi   ++
        jmp  ".Lprint"       ++
        label  ".Lfalse"     ++
        movq (ilab "false") !%rdi   ++
        label ".Lprint"     ++
        movq (imm 0) !%rax   ++
        call "printf"       ++
        ret;
      data =
        Hashtbl.fold (fun x _ l -> label x ++ dquad [1] ++ l) genv
          (label ".Sprint_int" ++ string "%d\n") ++
          (label "true"  ++ string "true\n")  ++
          (label "false" ++ string "false\n")
    }
  in
  let f = open_out ofile in
  let fmt = formatter_of_out_channel f in
  X86_64.print_program fmt p;
  (*  "flush" do buffer para garantir que tudo fica escrito antes do fecho
       deste  *)
  fprintf fmt "@?";
  close_out f
