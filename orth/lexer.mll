

(* Lexer para Arith *)

{
  open Lexing
  open Parser

  exception Lexing_error of string

  (*
  let id_or_kwd =
    let h = Hashtbl.create 32 in
    List.iter (fun (s, tok) -> Hashtbl.add h s tok)
      ["dup",DUP; "swap",SWAP; "drop",DROP; 
      "print",PRINT; "over",OVER; "rot",ROT
      "if", IF; "else", ELSE;
      "while", WHILE; "in", IN;
      "true", CST (Cbool true);
      "false", CST (Cbool false);
  fun s -> try Hashtbl.find h s with Not_found -> IDENT s
  *)
  let kwd_tbl = ["dup",CMD Dup; "swap", CMD Swap; "drop", CMD Drop; 
                 "printi", PRINT Printi; "printb", PRINT Printb; 
                 "prints", PRINT Prints; "over", CMD Over; "rot", CMD Rot;
                 "true", BOOL (true); "false", BOOL (false);
                 "min", OPS Min; "max", OPS Max; "mod", OPS Mod; "neg", OPS Neg;
                 ">=", OPS Ge; "<=", OPS Le; "<>", OPS Diff;
                 "if", IF; "else", ELSE; "end", END;
                 "while", WHILE; "in", IN; "proc", PROC;
                 "and", OPS And; "or", OPS Or;"let", LET; (*"set", SET*)
                ]
  let id_or_kwd s = try List.assoc s kwd_tbl with _ -> IDENT s

  let string_buffer = Buffer.create 1024


}

let letter = ['a'-'z' 'A'-'Z']
let digit = ['0'-'9']
let ident = letter (letter | digit)*
let integer = ['0'-'9']+
let space = [' ' '\t']

rule token = parse
  | '\n'    { new_line lexbuf; token lexbuf }
  | "#" [^'\n']* '\n' { new_line lexbuf; token lexbuf }
  | space+  { token lexbuf }
  | ident as id { id_or_kwd id }
  | '+'     { OPS Add }
  | '-'     { OPS Sub }
  | '*'     { OPS Mul }
  | '/'     { OPS Div }
  | '='     { OPS Equal }
  | '>'     { OPS Gt}
  | '<'     { OPS Lt}
  | "<>"    { OPS Diff}
  | ">="    { OPS Ge}
  | "<="    { OPS Le}
  | ":="    { ATR }
  | "@"     { FETCH}
  | integer as s { INT (int_of_string s) }
  | '"'     {STR (string lexbuf)}
  | eof     { EOF }
  | _ as c  { raise (Lexing_error ("illegal character: " ^ String.make 1 c)) }

and string = parse
  | '"'
      { let s = Buffer.contents string_buffer in
  Buffer.reset string_buffer;
  s }
  | "\\n"
      { Buffer.add_char string_buffer '\n';
  string lexbuf }
  | "\\\""
      { Buffer.add_char string_buffer '"';
  string lexbuf }
  | _ as c
      { Buffer.add_char string_buffer c;
  string lexbuf }
  | eof
      { raise (Lexing_error "unterminated string") }
