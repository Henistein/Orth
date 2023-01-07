(* Produção de código para a linguagem Arith *)

open Format
open X86_64
open Ast

(* TIPAGEM *)
type types = Tint | Tbool | Tstr

exception TypeError of string

let types_to_str = function
  | Tint  -> "[Int]"
  | Tbool -> "[Bool]"
  | Tstr  -> "[Str]"

let cmd_to_str = function
  | Ops Add   -> "<Add>"
  | Ops Sub   -> "<Sub>"
  | Ops Mul   -> "<Mul>"
  | Ops Div   -> "<Div>"
  | Ops Mod   -> "<Mod>"
  | Ops Min   -> "<Min>"
  | Ops Max   -> "<Max>"
  | Ops Neg   -> "<Neg>"
  | Ops Equal -> "<Equal>"
  | Ops Diff  -> "<Diff>"
  | Ops Gt    -> "<Gt>"
  | Ops Ge    -> "<Ge>"
  | Ops Lt    -> "<Lt>"
  | Ops Ge    -> "<Ge>"
  | Ops Le    -> "<Le>"
  | Ops And   -> "<And>"
  | Ops Or    -> "<Or>"
  | Cmd Dup   -> "<Dup>"
  | Cmd Swap  -> "<Swap>"
  | Cmd Drop  -> "<Drop>"
  | Cmd Over  -> "<Over>"
  | Cmd Rot   -> "<Rot>"
  | Print Printi -> "<Printi>"
  | Print Printb -> "<Printb>"
  | Print Prints -> "<Prints>"

let binop_exc cmd t1 t2 =
  match cmd with
  | Ops Add | Ops Sub | Ops Mul | Ops Div | Ops Mod | Ops Min | Ops Max ->
    (cmd_to_str cmd) ^ " necessita de [Int, Int] no fundo da pilha, mas foram encontrados: " ^ (types_to_str t1) ^ ", " ^ (types_to_str t2)
  | Ops Equal | Ops Diff | Ops Gt | Ops Lt | Ops Ge | Ops Le | Ops And | Ops Or -> 
    (cmd_to_str cmd) ^ " necessita de [Int, Int] ou [Bool, Bool] no fundo da pilha, mas foram encontrados: " ^ (types_to_str t1) ^ ", " ^ (types_to_str t2)

let unop_exc cmd t1 =
  match cmd with
  | Ops Neg -> 
    (cmd_to_str cmd) ^ " necessita de [Int] ou [Bool] no fundo da pilha, mas foi encontrado: " ^ (types_to_str t1)
  | Cmd Dup ->
    (cmd_to_str cmd) ^ " necessita de [Int], [Bool] ou [Str] no fundo da pilha, mas foi encontrado: " ^ (types_to_str t1)
  
let print_exc cmd t1 =
  match cmd with
  | Print Printi -> "[Int], mas foi encontrado: " ^ (types_to_str t1)
  | Print Printb -> "[Bool], mas foi encontrado: " ^ (types_to_str t1)
  | Print Prints -> "[Str], mas foi encontrado: " ^ (types_to_str t1)

let need_two_elems cmd = (cmd_to_str cmd) ^ " requer pelo menos dois elementos no fundo da pilha."
let need_one_elems cmd = (cmd_to_str cmd) ^ " requer pelo menos um elemento no fundo da pilha."

let push_type = function
  | Ops Add | Ops Sub | Ops Mul | Ops Div | Ops Mod | Ops Min | Ops Max | Ops Neg -> [Tint]
  | Cmd Dup -> [Tint;  Tint]
  | Ops Equal | Ops Diff | Ops Gt | Ops Lt | Ops Ge | Ops Le | Ops And | Ops Or   -> [Tbool]

let type_binop_arith st cmd = 
  match st with
  | Tint :: Tint :: rest -> (push_type cmd) @ rest
  | t1 :: t2 :: rest     -> raise (TypeError (binop_exc cmd t1 t2))
  | _                    -> raise (TypeError (need_two_elems cmd))

let type_binop_comp st cmd = 
  match st with
  | Tint :: Tint :: rest   -> (push_type cmd) @ rest
  | Tbool :: Tbool :: rest -> (push_type cmd) @ rest
  | t1 :: t2 :: rest       -> raise (TypeError (binop_exc cmd t1 t2))
  | _                      -> raise (TypeError (need_two_elems cmd))

let type_unop_cmd st cmd =
  match st with
  | Tint :: rest                -> (push_type cmd) @ rest
  | Tbool :: rest               -> (push_type cmd) @ rest
  | Tstr :: rest when cmd = Cmd Dup 
                                -> (push_type cmd) @ rest
  | t1 :: rest                  -> raise (TypeError (unop_exc cmd t1))
  | _                           -> raise (TypeError (need_one_elems cmd))

let type_binop_cmd st cmd = 
  match st with
  | t1 :: t2 :: rest when cmd = Cmd Swap -> t2 :: t1 :: rest
  | t1 :: t2 :: rest when cmd = Cmd Drop -> t2 :: rest
  | t1 :: t2 :: rest when cmd = Cmd Over -> t1 :: t2 :: t1 :: rest
  | t1 :: t2 :: t3 :: rest when cmd = Cmd Rot -> t1 :: t3 :: t2 :: rest
  | _                                    -> raise (TypeError (need_two_elems cmd))


let type_unop_print st cmd =
  match st with
  | Tint :: rest when cmd = Print Printi -> rest
  | Tbool :: rest when cmd = Print Printb -> rest
  | Tstr :: rest when cmd = Print Prints -> rest
  | t1 :: rest -> raise (TypeError ((cmd_to_str cmd) ^ " aceita apenas elementos do tipo " ^ (print_exc cmd t1)))
    

let rec type_program st cmd = 
  match cmd with
  | Ops Add | Ops Sub | Ops Mul | Ops Div | Ops Mod | Ops Min | Ops Max -> type_binop_arith st cmd
  | Ops Equal | Ops Diff | Ops Gt | Ops Lt | Ops Ge | Ops Le | Ops And | Ops Or -> type_binop_comp st cmd
  | Cmd Swap | Cmd Drop | Cmd Over | Cmd Rot -> type_binop_cmd st cmd
  | Print Printi | Print Printb | Print Prints -> type_unop_print st cmd
  | Ops Neg | Cmd Dup -> type_unop_cmd st cmd
(* TIPAGEM *)


(* Exceção por lançar quando uma variável (local ou global) é mal utilizada *)
exception VarUndef of string


(*a tabela de variáveis guarda uma string (nome da variável) e um inteiro. O inteiro serve para identificar se é um int ou bool, ou uma string.
   Caso seja uma string o inteiro serve para guardar o str_index, número que identifica a label da string.
   Caso seja int ou bool é igual a -1*)
let (var_tbl : (string, int) Hashtbl.t) = Hashtbl.create 17
let (str_tbl : (int, string) Hashtbl.t) = Hashtbl.create 17

let str_index = ref 0
let ifelse_index = ref 0
let ifthen_index = ref 0
let while_index = ref 0
let label_count = ref 0
let stack_types = ref []
let procs_tbl = Hashtbl.create 17

(* Utiliza-se  uma tabela associativa cujas chaves são as variáveis locais
   (strings) cujo valor associado é a posição da variável relativamente
   a $fp/%rsb (em bytes)
*)
module StrMap = Map.Make(String)

let compile_print = function
  | Printi -> 
    Printf.printf "PRINTI\n";
    stack_types := (type_program !stack_types (Print Printi));
    popq rdi ++
    call "print_int"

  | Printb -> 
    Printf.printf "PRINTB\n";
    stack_types := (type_program !stack_types (Print Printb));
    popq rdi ++
    call "print_bool"

  | Prints -> 
    Printf.printf "PRINTS\n";
    stack_types := (type_program !stack_types (Print Prints));
    popq rdi ++
    call "print_str"

let compile_cmds = function
  | Dup   -> 
    Printf.printf "DUP\n"; 
    stack_types := (type_program !stack_types (Cmd Dup));
    popq rdi ++
    pushq !%rdi ++
    pushq !%rdi

  | Swap  -> 
    Printf.printf "SWAP\n";
    stack_types := (type_program !stack_types (Cmd Swap));
    popq rdi ++
    popq rsi ++
    pushq !%rdi ++
    pushq !%rsi 

  | Drop  -> 
    Printf.printf "DROP\n";
    stack_types := (type_program !stack_types (Cmd Drop));
    popq rdi

  | Over  -> 
    Printf.printf "Over\n";
    stack_types := (type_program !stack_types (Cmd Over));
    popq rdi ++
    popq rsi ++
    pushq !%rsi ++
    pushq !%rdi ++
    pushq !%rsi

  | Rot   -> 
    Printf.printf "ROT\n";
    stack_types := (type_program !stack_types (Cmd Rot));
    popq rdi ++ 
    popq rsi ++ 
    popq rcx ++ 
    pushq !%rsi ++ 
    pushq !%rdi ++ 
    pushq !%rcx    

let compile_ops = function
  (* Aritmetica *)
  | Add   -> Printf.printf "Add\n"; 
             stack_types := (type_program !stack_types (Ops Add));
             popq rbx ++
             popq rax ++
             addq !%rbx !%rax ++
             pushq !%rax
  | Sub   -> Printf.printf "Sub\n"; 
             stack_types := (type_program !stack_types (Ops Sub));
             popq rbx ++
             popq rax ++
             subq !%rbx !%rax ++
             pushq !%rax
  | Mul   -> Printf.printf "Mul\n"; 
             stack_types := (type_program !stack_types (Ops Mul));
             popq rbx ++
             popq rax ++
             imulq !%rbx !%rax ++
             pushq !%rax 
  | Div   -> Printf.printf "Div\n"; 
             stack_types := (type_program !stack_types (Ops Div));
             popq rdi ++ 
             popq rax ++ 
             movq (imm 0) !%rdx ++ 
             idivq !%rdi ++ 
             pushq !%rax
  | Neg   -> Printf.printf "Neg\n";
             stack_types := (type_program !stack_types (Ops Neg));
             popq rax ++
             movq (imm (-1)) !%rbx ++
             imulq !%rbx !%rax ++
             pushq !%rax 
  | Mod   -> Printf.printf "Mod\n";
             stack_types := (type_program !stack_types (Ops Mod));
             popq rdi ++ 
             popq rax ++ 
             movq (imm 0) !%rdx ++ 
             idivq !%rdi ++ 
             pushq !%rdx
  | Min   -> Printf.printf "Min\n";
             stack_types := (type_program !stack_types (Ops Min));
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
             stack_types := (type_program !stack_types (Ops Max));
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
  | Equal -> Printf.printf "Equal\n"; 
             stack_types := (type_program !stack_types (Ops Equal));
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
  | Diff   -> Printf.printf "Diff\n";
             stack_types := (type_program !stack_types (Ops Diff));
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
             stack_types := (type_program !stack_types (Ops Gt));
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
             stack_types := (type_program !stack_types (Ops Lt));
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
             stack_types := (type_program !stack_types (Ops Ge));
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
             stack_types := (type_program !stack_types (Ops Le));
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
             stack_types := (type_program !stack_types (Ops And));
             popq rax ++
             popq rbx ++
             andq !%rbx !%rax ++
             pushq !%rax
  | Or     -> Printf.printf "Or\n";
             stack_types := (type_program !stack_types (Ops Or));
             popq rax ++
             popq rbx ++
             orq !%rbx !%rax ++
             pushq !%rax 

(* Compilação de uma expressão *)
let rec comprec = function
  | Int i ->
      Printf.printf "INT: %d\n" i;
      stack_types := Tint :: !stack_types;
      pushq (imm i)
  | Bool b ->
      Printf.printf "BOOL: %b\n" b;
      stack_types := Tbool :: !stack_types;
      if b then pushq (imm 1) else pushq (imm 0) 
  | Str s ->
      Printf.printf "STR: %s\n" s;
      stack_types := Tstr :: !stack_types;
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
  | Ifelse (b1, b2) ->
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
  | Ifthen b ->
    Printf.printf "IF then: \n";
    ifthen_index := !ifthen_index + 1;
    let if_num = !ifthen_index in
      (comment ("If: " ^ (string_of_int if_num))) ++
      (* Extrai o valor da condicao *)
      popq rbx ++
      cmpq (imm 0) !%rbx ++
      (* Se for zero salta para a label do continua *)
      je ("if_continua_"^(string_of_int if_num)) ++
      (* Compilar o corpo do if *) 
      (List.fold_right (++) (List.rev (List.map comprec b)) nop) ++
      (* Criar label para o programa continuar *)
      label ("if_continua_" ^ (string_of_int if_num))
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
        | Str v -> Hashtbl.replace var_tbl id (!str_index + 1); 
                   popq rax  (*o espaço da memória com a label já tem a string, por isso só é preciso tirá-la da pilha*)
        | Int v -> Hashtbl.replace var_tbl id (-1);
                   popq rax ++
                   movq !%rax (lab id)
        | Bool v -> Hashtbl.replace var_tbl id (-1); 
                   popq rax ++
                   movq !%rax (lab id)
        | Fetch v -> Hashtbl.replace var_tbl id (-1); 
                   popq rax ++
                   movq !%rax (lab id)
        | _ -> Printf.printf "A variável %s tem de ser do tipo Str, Int, Bool ou @Var.\n" id; nop 
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
          Hashtbl.fold (fun x i l -> if i=(-1) then label x ++ dquad [1] ++ l else nop ++ l) var_tbl nop ++
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
