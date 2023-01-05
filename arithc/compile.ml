(* Produção de código para a linguagem Arith *)

open Format
open X86_64
open Ast

(* Exceção por lançar quando uma variável (local ou global) é mal utilizada *)
exception VarUndef of string

let str_index = ref 0
let (str_tbl : (int, string) Hashtbl.t) = Hashtbl.create 17

(*a tabela de variáveis guarda uma string (nome da variável) e um inteiro. O inteiro serve para identificar se é um int ou bool, ou uma string.
   Caso seja uma string o inteiro serve para guardar o str_index, número que identifica a label da string.
   Caso seja int ou bool é igual a -1*)
let (var_tbl : (string, int) Hashtbl.t) = Hashtbl.create 17

let ifelse_index = ref 0
let while_index = ref 0
(*let (procs_tbl : (string, X86_64.asm) Hashtbl.t) = Hashtbl.create 17*)
let procs_tbl = Hashtbl.create 17
let label_count = ref 0

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
  (* Aritmetica *)
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
  | Equal -> Printf.printf "Equal\n"; 
             label_count := !label_count + 2;
             popq rbx ++
             popq rax ++
             cmpq !%rbx !%rax ++
             je (".L"^string_of_int (!label_count-1)) ++ (*caso sejam iguais, saltar para L1*)
             movq (imm 0) !%rax ++ (*caso sejam diferentes colocar 0 no registo*)
             jmp (".L"^string_of_int !label_count) ++ (*saltar para a segunda label*)
             label (".L"^string_of_int (!label_count-1)) ++ (*L1*)
             movq (imm 1) !%rax ++
             label (".L"^string_of_int (!label_count)) ++ (*L2*)
             pushq !%rax
  | Neg   -> Printf.printf "Neg\n";
             popq rax ++
             movq (imm (-1)) !%rbx ++
             imulq !%rbx !%rax ++
             pushq !%rax 
  | Mod   -> Printf.printf "Mod\n";
             popq rdi ++ 
             popq rax ++ 
             movq (imm 0) !%rdx ++ 
             idivq !%rdi ++ 
             pushq !%rdx
  | Min   -> Printf.printf "Min\n";
             label_count := !label_count + 2;
             popq rax ++
             popq rbx ++
             cmpq !%rax !%rbx ++
             jg (".L"^string_of_int (!label_count-1)) ++ (*caso o número no rax seja o menor*)
             pushq !%rbx ++
             jmp (".L"^string_of_int !label_count) ++ 
             label (".L"^string_of_int (!label_count-1)) ++ 
             pushq !%rax ++
             label (".L"^string_of_int !label_count)
  | Max   -> Printf.printf "Max\n";
             label_count := !label_count + 2;
             popq rax ++
             popq rbx ++
             cmpq !%rax !%rbx ++
             jg (".L"^string_of_int (!label_count-1)) ++ (*caso o número no rax seja o maior*)
             pushq !%rax ++
             jmp (".L"^string_of_int !label_count) ++ 
             label (".L"^string_of_int (!label_count-1)) ++ 
             pushq !%rbx ++
             label (".L"^string_of_int !label_count)
  (* Comparacao *)
  | Diff   -> Printf.printf "Diff\n";
             label_count := !label_count + 2;
             popq rbx ++
             popq rax ++
             cmpq !%rbx !%rax ++
             je (".L"^string_of_int (!label_count-1)) ++ 
             movq (imm 1) !%rax ++ 
             jmp (".L"^string_of_int !label_count) ++ 
             label (".L"^string_of_int (!label_count-1)) ++ 
             movq (imm 0) !%rax ++
             label (".L"^string_of_int (!label_count)) ++ 
             pushq !%rax
  | Gt     -> Printf.printf "Gt\n";
             label_count := !label_count + 2;
             popq rax ++ 
             popq rbx ++ 
             cmpq !%rax !%rbx ++ 
             jg (".L"^string_of_int (!label_count-1)) ++ 
             movq (imm 0) !%rax ++
             jmp (".L"^string_of_int !label_count) ++ 
             label (".L"^string_of_int (!label_count-1)) ++ 
             movq (imm 1) !%rax ++
             label (".L"^string_of_int !label_count) ++
             pushq !%rax 
  | Lt     -> Printf.printf "Lt\n";
             label_count := !label_count + 2;
             popq rax ++
             popq rbx ++
             cmpq !%rax !%rbx ++
             jl (".L"^string_of_int (!label_count-1)) ++ 
             movq (imm 0) !%rax ++
             jmp (".L"^string_of_int !label_count) ++ 
             label (".L"^string_of_int (!label_count-1)) ++ 
             movq (imm 1) !%rax ++
             label (".L"^string_of_int !label_count) ++
             pushq !%rax
  | Ge     -> Printf.printf "Ge\n";
             label_count := !label_count + 2;
             popq rax ++
             popq rbx ++
             cmpq !%rax !%rbx ++
             jge (".L"^string_of_int (!label_count-1)) ++ 
             movq (imm 0) !%rax ++
             jmp (".L"^string_of_int !label_count) ++ 
             label (".L"^string_of_int (!label_count-1)) ++ 
             movq (imm 1) !%rax ++
             label (".L"^string_of_int !label_count) ++
             pushq !%rax
  | Le     -> Printf.printf "Le\n";
             label_count := !label_count + 2;
             popq rax ++
             popq rbx ++
             cmpq !%rax !%rbx ++
             jle (".L"^string_of_int (!label_count-1)) ++ 
             movq (imm 0) !%rax ++
             jmp (".L"^string_of_int !label_count) ++ 
             label (".L"^string_of_int (!label_count-1)) ++ 
             movq (imm 1) !%rax ++
             label (".L"^string_of_int !label_count) ++
             pushq !%rax
  | And    -> Printf.printf "And\n"; 
             popq rax ++
             popq rbx ++
             andq !%rbx !%rax ++
             pushq !%rax
  | Or     -> Printf.printf "Or\n";
             popq rax ++
             popq rbx ++
             orq !%rbx !%rax ++
             pushq !%rax 

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
      Printf.printf "IF: %d\n" !ifelse_index;
      ifelse_index := !ifelse_index + 1;
      let cond_num = !ifelse_index in
      (comment ("If: " ^ (string_of_int cond_num))) ++
      (* Extrai o ultimo valor da pilha e compara-o com zero*)
      popq rbx ++
      cmpq (imm 0) !%rbx ++
      (* Se for zero salta para a label do else *)
      je ("else_"^(string_of_int cond_num)) ++
      (* compila o corpo do if *)
      (List.fold_right (++) (List.rev (List.map comprec b1)) nop) ++
      jmp ("ifelse_continua_"^(string_of_int cond_num)) ++
      (* Cria label do else *)
      label ("else_"^(string_of_int cond_num)) ++
      (* compila o corpo do else *)
      (List.fold_right (++) (List.rev (List.map comprec b2)) nop) ++
      jmp ("ifelse_continua_"^(string_of_int cond_num)) ++
      (* Cria label para o programa continuar*)
      label ("ifelse_continua_" ^ (string_of_int cond_num))
  | While (c, b) ->
      Printf.printf "WHILE: \n";
      while_index := !while_index + 1;
      let w_num = !while_index in
        (comment ("While: " ^ (string_of_int w_num))) ++
        (* Compila a condicao *)
        (List.fold_right (++) (List.rev (List.map comprec c)) nop) ++
        (* Extrai o valor da condicao *)
        popq rbx ++
        cmpq (imm 0) !%rbx ++
        (* Se for zero salta para a label continua *)
        je ("while_continua_"^(string_of_int w_num)) ++
        (* Cria a label do while *)
        label ("while_"^(string_of_int w_num)) ++
        (* compila o corpo do while *)
        (List.fold_right (++) (List.rev (List.map comprec b)) nop) ++
        (* Compila a condicao novamente *)
        (List.fold_right (++) (List.rev (List.map comprec c)) nop) ++
        popq rbx ++
        cmpq (imm 0) !%rbx ++
        (* Continua o loop *)
        jne ("while_"^(string_of_int w_num)) ++
        (* Cria label para o programa continuar *)
        label ("while_continua_"^(string_of_int w_num))
  | Proc (s, b) ->
      Printf.printf "Proc: \n";
      (* Adicionar a proc a Hashtbl *)
      let proc_body = List.rev b in
      let proc_body = List.map comprec proc_body in
      let proc_body = List.fold_right (++) proc_body nop in
        Hashtbl.add procs_tbl s proc_body;
      nop
  | Ident s ->
      Printf.printf "Ident: %s\n" s;
      call s
  | Fetch id ->
      Printf.printf "Var: %s\n" id;
      (*começa por verificar que a variável foi definida*)
      begin
      try 
        let i = (Hashtbl.find var_tbl id) in 
        if i = (-1) then (*caso seja bool ou int*)
          movq (lab id) !%rax ++
          pushq !%rax
        else
          movq (ilab ("str_"^string_of_int i)) !%rax ++
          pushq !%rax
      with Not_found -> Printf.printf "A variável %s não existe." id;nop;
      end;
  | Let (id,v) -> 
      Printf.printf "Let: %s\n" id;
      comprec v ++
      begin
        match v with
        | Str v -> Printf.printf "%d" !str_index;Hashtbl.replace var_tbl id (!str_index + 1); 
                   popq rax  (*o espaço da memória com a label já tem a string, por isso só é preciso tirá-la da pilha*)
        | Int v -> Hashtbl.replace var_tbl id (-1);
                   popq rax ++
                   movq !%rax (lab id)
        | Bool v -> Hashtbl.replace var_tbl id (-1); 
                   popq rax ++
                   movq !%rax (lab id)
        | _ -> Printf.printf "A variável %s tem de ser do tipo Str, Int ou Bool.\n" id; nop 
      end

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
        ret ++
        (* procs *)
        (Hashtbl.fold (fun s b l -> label s ++ b ++ ret ++ l) procs_tbl) nop;
      data =
          (*caso seja 0 (não é uma string), é utilizado .quad; caso contrário .string*)
          Hashtbl.fold (fun x i l -> if i=(-1) then label x ++ dquad [1] ++ l else nop) var_tbl nop ++
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
