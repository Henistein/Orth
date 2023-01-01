
(* Produção de código para a linguagem Arith *)

open Format
open X86_64
open Ast

(* Exceção por lançar quando uma variável (local ou global) é mal utilizada *)
exception VarUndef of string

let str_index = ref 0
let (str_tbl : (int, string) Hashtbl.t) = Hashtbl.create 17

let else_index = ref 0

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

  | Prints -> 
    Printf.printf "PRINTS\n";
    popq rdi ++
    call "print_str"

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
let rec comprec = function
  | Int i ->
      Printf.printf "INT: %d\n" i;
      pushq (imm i)
  | Bool b ->
      Printf.printf "BOOL: %b\n" b;
      if b then pushq (imm 1) else pushq (imm 0) 
  | Str s ->
      Printf.printf "STR: %s\n" s;
      str_index := !str_index + 1;
      Hashtbl.add str_tbl !str_index s;
      pushq (ilab ("str_" ^ (string_of_int !str_index)));
  | Cmd c ->
      Printf.printf "CMD: ";
      compile_cmds c;
  | Ops o ->
      Printf.printf "OPS: ";
      compile_ops o;
  | Print p ->
      Printf.printf "PRINT: ";
      compile_print p;
  | If (b1, b2) ->
      else_index := !else_index + 1;
      let cond_num = !else_index in
      Printf.printf "IF: %d\n" cond_num;
      (comment ("If: " ^ (string_of_int cond_num))) ++
      (* Extrai o ultimo valor da pilha e compara-o com zero*)
      popq rbx ++
      cmpq (imm 0) !%rbx ++
      je ("else_"^(string_of_int cond_num)) ++
      (* compila o corpo do if *)
      (List.fold_right (++) (List.rev (List.map comprec b1)) nop) ++
      jmp ("continua_"^(string_of_int cond_num)) ++
      (* Cria label do else *)
      label ("else_"^(string_of_int cond_num)) ++
      (List.fold_right (++) (List.rev (List.map comprec b2)) nop) ++
      jmp ("continua_"^(string_of_int cond_num)) ++
      (* Cria label para o programa continuar*)
      label ("continua_" ^ (string_of_int cond_num))


(* Compila o programa p e grava o código no ficheiro ofile *)
let compile_program p ofile =
  let code = List.map comprec p in
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
        ret ++
        (* print_str *)
        label "print_str" ++
        movq !%rdi !%rsi ++
        leaq (lab ".Sprint_str") rdi ++
        movq (imm 0) !%rax ++
        call "printf" ++
        ret;
      data =
          Hashtbl.fold (fun i s l -> label ("str_" ^ (string_of_int i)) ++ string s ++ l) str_tbl
          (*((Hashtbl.fold (fun i e l -> label ("else_" ^ (string_of_int i)) ++ comprec e ++ l) else_tbl)*)
          (label ".Sprint_int" ++ string "%d\n") ++
          (label ".Sprint_str" ++ string "%s") ++
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
