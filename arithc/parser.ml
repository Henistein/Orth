
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WHILE
    | STR of (
# 9 "parser.mly"
       (string)
# 16 "parser.ml"
  )
    | PROC
    | PRINT of (
# 14 "parser.mly"
       (Ast.print)
# 22 "parser.ml"
  )
    | OPS of (
# 13 "parser.mly"
       (Ast.operation)
# 27 "parser.ml"
  )
    | LET
    | INT of (
# 8 "parser.mly"
       (int)
# 33 "parser.ml"
  )
    | IN
    | IF
    | IDENT of (
# 10 "parser.mly"
       (string)
# 40 "parser.ml"
  )
    | FETCH
    | EOF
    | END
    | ELSE
    | CMD of (
# 12 "parser.mly"
       (Ast.command)
# 49 "parser.ml"
  )
    | BOOL of (
# 11 "parser.mly"
       (bool)
# 54 "parser.ml"
  )
    | ATR
  
end

include MenhirBasics

# 4 "parser.mly"
  
  open Ast

# 66 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState01 : (('s, _menhir_box_prog) _menhir_cell1_WHILE, _menhir_box_prog) _menhir_state
    (** State 01.
        Stack shape : WHILE.
        Start symbol: prog. *)

  | MenhirState03 : (('s, _menhir_box_prog) _menhir_cell1_PROC, _menhir_box_prog) _menhir_state
    (** State 03.
        Stack shape : PROC.
        Start symbol: prog. *)

  | MenhirState06 : ((('s, _menhir_box_prog) _menhir_cell1_PROC, _menhir_box_prog) _menhir_cell1_ident, _menhir_box_prog) _menhir_state
    (** State 06.
        Stack shape : PROC ident.
        Start symbol: prog. *)

  | MenhirState11 : (('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT, _menhir_box_prog) _menhir_state
    (** State 11.
        Stack shape : LET IDENT.
        Start symbol: prog. *)

  | MenhirState13 : (('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_state
    (** State 13.
        Stack shape : IF.
        Start symbol: prog. *)

  | MenhirState18 : ((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_state
    (** State 18.
        Stack shape : IF stmts.
        Start symbol: prog. *)

  | MenhirState20 : (((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_ELSE, _menhir_box_prog) _menhir_state
    (** State 20.
        Stack shape : IF stmts ELSE.
        Start symbol: prog. *)

  | MenhirState21 : ((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_ELSE, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_state
    (** State 21.
        Stack shape : IF stmts ELSE stmts.
        Start symbol: prog. *)

  | MenhirState27 : (((('s, _menhir_box_prog) _menhir_cell1_PROC, _menhir_box_prog) _menhir_cell1_ident, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_state
    (** State 27.
        Stack shape : PROC ident stmts.
        Start symbol: prog. *)

  | MenhirState29 : ((('s, _menhir_box_prog) _menhir_cell1_WHILE, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_state
    (** State 29.
        Stack shape : WHILE stmts.
        Start symbol: prog. *)

  | MenhirState30 : (((('s, _menhir_box_prog) _menhir_cell1_WHILE, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_state
    (** State 30.
        Stack shape : WHILE stmts IN.
        Start symbol: prog. *)

  | MenhirState31 : ((((('s, _menhir_box_prog) _menhir_cell1_WHILE, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_state
    (** State 31.
        Stack shape : WHILE stmts IN stmts.
        Start symbol: prog. *)

  | MenhirState33 : (('s, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_state
    (** State 33.
        Stack shape : stmts.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_ident = 
  | MenhirCell1_ident of 's * ('s, 'r) _menhir_state * (string)

and ('s, 'r) _menhir_cell1_stmts = 
  | MenhirCell1_stmts of 's * ('s, 'r) _menhir_state * (Ast.expr list)

and ('s, 'r) _menhir_cell1_ELSE = 
  | MenhirCell1_ELSE of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 10 "parser.mly"
       (string)
# 153 "parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IN = 
  | MenhirCell1_IN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PROC = 
  | MenhirCell1_PROC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_WHILE = 
  | MenhirCell1_WHILE of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (Ast.program) [@@unboxed]

let _menhir_action_01 =
  fun i ->
    (
# 39 "parser.mly"
                                               ( Int  i )
# 179 "parser.ml"
     : (Ast.expr))

let _menhir_action_02 =
  fun s ->
    (
# 40 "parser.mly"
                                               ( Str  s )
# 187 "parser.ml"
     : (Ast.expr))

let _menhir_action_03 =
  fun b ->
    (
# 41 "parser.mly"
                                               ( Bool b )
# 195 "parser.ml"
     : (Ast.expr))

let _menhir_action_04 =
  fun c ->
    (
# 42 "parser.mly"
                                               ( Cmd c  )
# 203 "parser.ml"
     : (Ast.expr))

let _menhir_action_05 =
  fun o ->
    (
# 43 "parser.mly"
                                               ( Ops o  )
# 211 "parser.ml"
     : (Ast.expr))

let _menhir_action_06 =
  fun prnt ->
    (
# 44 "parser.mly"
                                               ( Print prnt)
# 219 "parser.ml"
     : (Ast.expr))

let _menhir_action_07 =
  fun id ->
    (
# 45 "parser.mly"
                                               ( Ident id )
# 227 "parser.ml"
     : (Ast.expr))

let _menhir_action_08 =
  fun body1 body2 ->
    (
# 46 "parser.mly"
                                               ( Ifelse (body1, body2) )
# 235 "parser.ml"
     : (Ast.expr))

let _menhir_action_09 =
  fun body1 ->
    (
# 47 "parser.mly"
                                               ( Ifthen (body1) )
# 243 "parser.ml"
     : (Ast.expr))

let _menhir_action_10 =
  fun body cond ->
    (
# 48 "parser.mly"
                                               ( While (cond, body) )
# 251 "parser.ml"
     : (Ast.expr))

let _menhir_action_11 =
  fun body name ->
    (
# 49 "parser.mly"
                                               ( Proc (name, body) )
# 259 "parser.ml"
     : (Ast.expr))

let _menhir_action_12 =
  fun e id ->
    (
# 50 "parser.mly"
                                               ( Let (id,e) )
# 267 "parser.ml"
     : (Ast.expr))

let _menhir_action_13 =
  fun id ->
    (
# 51 "parser.mly"
                                               ( Fetch (id) )
# 275 "parser.ml"
     : (Ast.expr))

let _menhir_action_14 =
  fun id ->
    (
# 36 "parser.mly"
             ( id )
# 283 "parser.ml"
     : (string))

let _menhir_action_15 =
  fun p ->
    (
# 28 "parser.mly"
                ( List.rev p )
# 291 "parser.ml"
     : (Ast.program))

let _menhir_action_16 =
  fun i ->
    (
# 31 "parser.mly"
                     ( [i] )
# 299 "parser.ml"
     : (Ast.expr list))

let _menhir_action_17 =
  fun i l ->
    (
# 32 "parser.mly"
                     ( i :: l )
# 307 "parser.ml"
     : (Ast.expr list))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ATR ->
        "ATR"
    | BOOL _ ->
        "BOOL"
    | CMD _ ->
        "CMD"
    | ELSE ->
        "ELSE"
    | END ->
        "END"
    | EOF ->
        "EOF"
    | FETCH ->
        "FETCH"
    | IDENT _ ->
        "IDENT"
    | IF ->
        "IF"
    | IN ->
        "IN"
    | INT _ ->
        "INT"
    | LET ->
        "LET"
    | OPS _ ->
        "OPS"
    | PRINT _ ->
        "PRINT"
    | PROC ->
        "PROC"
    | STR _ ->
        "STR"
    | WHILE ->
        "WHILE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | STR _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_02 s in
          _menhir_run_25_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | PRINT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v in
          let _v = _menhir_action_06 prnt in
          _menhir_run_25_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v in
          let _v = _menhir_action_05 o in
          _menhir_run_25_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_25_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let id = _v in
            _menhir_action_14 id
          in
          let id = _v in
          let _v = _menhir_action_07 id in
          _menhir_run_25_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FETCH ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | CMD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v in
          let _v = _menhir_action_04 c in
          _menhir_run_25_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v in
          let _v = _menhir_action_03 b in
          _menhir_run_25_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_25_spec_01 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_WHILE -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let i = _v in
      let _v = _menhir_action_16 i in
      _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
  
  and _menhir_run_29 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
      | STR _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v_0 in
          let _v = _menhir_action_02 s in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
      | PRINT _v_2 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v_2 in
          let _v = _menhir_action_06 prnt in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v_4 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v_4 in
          let _v = _menhir_action_05 o in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
      | INT _v_6 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_6 in
          let _v = _menhir_action_01 i in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IN ->
          let _menhir_stack = MenhirCell1_IN (_menhir_stack, MenhirState29) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | STR _v_8 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v_8 in
              let _v = _menhir_action_02 s in
              _menhir_run_25_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | PRINT _v_10 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let prnt = _v_10 in
              let _v = _menhir_action_06 prnt in
              _menhir_run_25_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | OPS _v_12 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let o = _v_12 in
              let _v = _menhir_action_05 o in
              _menhir_run_25_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | LET ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | INT _v_14 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_14 in
              let _v = _menhir_action_01 i in
              _menhir_run_25_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | IDENT _v_16 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_17 =
                let id = _v_16 in
                _menhir_action_14 id
              in
              let id = _v_17 in
              let _v = _menhir_action_07 id in
              _menhir_run_25_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FETCH ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | CMD _v_19 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let c = _v_19 in
              let _v = _menhir_action_04 c in
              _menhir_run_25_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | BOOL _v_21 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let b = _v_21 in
              let _v = _menhir_action_03 b in
              _menhir_run_25_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | IF ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
      | IDENT _v_23 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_24 =
            let id = _v_23 in
            _menhir_action_14 id
          in
          let id = _v_24 in
          let _v = _menhir_action_07 id in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FETCH ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState29
      | CMD _v_26 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v_26 in
          let _v = _menhir_action_04 c in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v_28 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v_28 in
          let _v = _menhir_action_03 b in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_stmts -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_stmts (_menhir_stack, _menhir_s, l) = _menhir_stack in
      let i = _v in
      let _v = _menhir_action_17 i l in
      _menhir_goto_stmts _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_stmts : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState30 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState06 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_33 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | STR _v_0 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v_0 in
          let _v = _menhir_action_02 s in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | PRINT _v_2 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v_2 in
          let _v = _menhir_action_06 prnt in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v_4 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v_4 in
          let _v = _menhir_action_05 o in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LET ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | INT _v_6 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_6 in
          let _v = _menhir_action_01 i in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | IDENT _v_8 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_9 =
            let id = _v_8 in
            _menhir_action_14 id
          in
          let id = _v_9 in
          let _v = _menhir_action_07 id in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FETCH ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | EOF ->
          let p = _v in
          let _v = _menhir_action_15 p in
          MenhirBox_prog _v
      | CMD _v_11 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v_11 in
          let _v = _menhir_action_04 c in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v_13 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v_13 in
          let _v = _menhir_action_03 b in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PROC (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let id = _v in
            _menhir_action_14 id
          in
          let _menhir_stack = MenhirCell1_ident (_menhir_stack, MenhirState03, _v) in
          (match (_tok : MenhirBasics.token) with
          | IN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | WHILE ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
              | STR _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let s = _v_0 in
                  let _v = _menhir_action_02 s in
                  _menhir_run_25_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | PROC ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
              | PRINT _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let prnt = _v_2 in
                  let _v = _menhir_action_06 prnt in
                  _menhir_run_25_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | OPS _v_4 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let o = _v_4 in
                  let _v = _menhir_action_05 o in
                  _menhir_run_25_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | LET ->
                  _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
              | INT _v_6 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_6 in
                  let _v = _menhir_action_01 i in
                  _menhir_run_25_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | IF ->
                  _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
              | IDENT _v_8 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v_9 =
                    let id = _v_8 in
                    _menhir_action_14 id
                  in
                  let id = _v_9 in
                  let _v = _menhir_action_07 id in
                  _menhir_run_25_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | FETCH ->
                  _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
              | CMD _v_11 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let c = _v_11 in
                  let _v = _menhir_action_04 c in
                  _menhir_run_25_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | BOOL _v_13 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let b = _v_13 in
                  let _v = _menhir_action_03 b in
                  _menhir_run_25_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_25_spec_06 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_PROC, _menhir_box_prog) _menhir_cell1_ident -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let i = _v in
      let _v = _menhir_action_16 i in
      _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
  
  and _menhir_run_27 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_PROC, _menhir_box_prog) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | STR _v_0 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v_0 in
          let _v = _menhir_action_02 s in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | PRINT _v_2 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v_2 in
          let _v = _menhir_action_06 prnt in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v_4 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v_4 in
          let _v = _menhir_action_05 o in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LET ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | INT _v_6 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_6 in
          let _v = _menhir_action_01 i in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | IDENT _v_8 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_9 =
            let id = _v_8 in
            _menhir_action_14 id
          in
          let id = _v_9 in
          let _v = _menhir_action_07 id in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FETCH ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
      | END ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ident (_menhir_stack, _, name) = _menhir_stack in
          let MenhirCell1_PROC (_menhir_stack, _menhir_s) = _menhir_stack in
          let body = _v in
          let _v = _menhir_action_11 body name in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | CMD _v_11 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v_11 in
          let _v = _menhir_action_04 c in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v_13 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v_13 in
          let _v = _menhir_action_03 b in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ATR ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | WHILE ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
              | STR _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let s = _v_0 in
                  let _v = _menhir_action_02 s in
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | PROC ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
              | PRINT _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let prnt = _v_2 in
                  let _v = _menhir_action_06 prnt in
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | OPS _v_4 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let o = _v_4 in
                  let _v = _menhir_action_05 o in
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | LET ->
                  _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
              | INT _v_6 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_6 in
                  let _v = _menhir_action_01 i in
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | IF ->
                  _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
              | IDENT _v_8 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v_9 =
                    let id = _v_8 in
                    _menhir_action_14 id
                  in
                  let id = _v_9 in
                  let _v = _menhir_action_07 id in
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | FETCH ->
                  _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
              | CMD _v_11 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let c = _v_11 in
                  let _v = _menhir_action_04 c in
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | BOOL _v_13 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let b = _v_13 in
                  let _v = _menhir_action_03 b in
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, id) = _menhir_stack in
      let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_12 e id in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState11 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_25_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState01 ->
          _menhir_run_25_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState30 ->
          _menhir_run_25_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState06 ->
          _menhir_run_25_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState13 ->
          _menhir_run_25_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState20 ->
          _menhir_run_25_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState33 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState29 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState31 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState27 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState18 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState21 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_25_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let i = _v in
      let _v = _menhir_action_16 i in
      _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
  
  and _menhir_run_25_spec_30 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_WHILE, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_IN -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let i = _v in
      let _v = _menhir_action_16 i in
      _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30 _tok
  
  and _menhir_run_31 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_WHILE, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
      | STR _v_0 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v_0 in
          let _v = _menhir_action_02 s in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
      | PRINT _v_2 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v_2 in
          let _v = _menhir_action_06 prnt in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v_4 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v_4 in
          let _v = _menhir_action_05 o in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LET ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
      | INT _v_6 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_6 in
          let _v = _menhir_action_01 i in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
      | IDENT _v_8 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_9 =
            let id = _v_8 in
            _menhir_action_14 id
          in
          let id = _v_9 in
          let _v = _menhir_action_07 id in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FETCH ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState31
      | END ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_IN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_stmts (_menhir_stack, _, cond) = _menhir_stack in
          let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
          let body = _v in
          let _v = _menhir_action_10 body cond in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | CMD _v_11 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v_11 in
          let _v = _menhir_action_04 c in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v_13 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v_13 in
          let _v = _menhir_action_03 b in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | STR _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_02 s in
          _menhir_run_25_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | PRINT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v in
          let _v = _menhir_action_06 prnt in
          _menhir_run_25_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v in
          let _v = _menhir_action_05 o in
          _menhir_run_25_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_25_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let id = _v in
            _menhir_action_14 id
          in
          let id = _v in
          let _v = _menhir_action_07 id in
          _menhir_run_25_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FETCH ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | CMD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v in
          let _v = _menhir_action_04 c in
          _menhir_run_25_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v in
          let _v = _menhir_action_03 b in
          _menhir_run_25_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_25_spec_13 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_IF -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let i = _v in
      let _v = _menhir_action_16 i in
      _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
  
  and _menhir_run_18 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
      | STR _v_0 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v_0 in
          let _v = _menhir_action_02 s in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
      | PRINT _v_2 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v_2 in
          let _v = _menhir_action_06 prnt in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v_4 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v_4 in
          let _v = _menhir_action_05 o in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LET ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
      | INT _v_6 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_6 in
          let _v = _menhir_action_01 i in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
      | IDENT _v_8 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_9 =
            let id = _v_8 in
            _menhir_action_14 id
          in
          let id = _v_9 in
          let _v = _menhir_action_07 id in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FETCH ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
      | END ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let body1 = _v in
          let _v = _menhir_action_09 body1 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | ELSE ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell1_ELSE (_menhir_stack, MenhirState18) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
          | STR _v_11 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v_11 in
              let _v = _menhir_action_02 s in
              _menhir_run_25_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
          | PRINT _v_13 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let prnt = _v_13 in
              let _v = _menhir_action_06 prnt in
              _menhir_run_25_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | OPS _v_15 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let o = _v_15 in
              let _v = _menhir_action_05 o in
              _menhir_run_25_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | LET ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
          | INT _v_17 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_17 in
              let _v = _menhir_action_01 i in
              _menhir_run_25_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
          | IDENT _v_19 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_20 =
                let id = _v_19 in
                _menhir_action_14 id
              in
              let id = _v_20 in
              let _v = _menhir_action_07 id in
              _menhir_run_25_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FETCH ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
          | CMD _v_22 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let c = _v_22 in
              let _v = _menhir_action_04 c in
              _menhir_run_25_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | BOOL _v_24 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let b = _v_24 in
              let _v = _menhir_action_03 b in
              _menhir_run_25_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | CMD _v_26 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v_26 in
          let _v = _menhir_action_04 c in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v_28 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v_28 in
          let _v = _menhir_action_03 b in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let id = _v in
          let _v = _menhir_action_13 id in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_25_spec_20 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_ELSE -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let i = _v in
      let _v = _menhir_action_16 i in
      _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20 _tok
  
  and _menhir_run_21 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_ELSE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | STR _v_0 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v_0 in
          let _v = _menhir_action_02 s in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | PRINT _v_2 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v_2 in
          let _v = _menhir_action_06 prnt in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v_4 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v_4 in
          let _v = _menhir_action_05 o in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LET ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | INT _v_6 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_6 in
          let _v = _menhir_action_01 i in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | IDENT _v_8 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_9 =
            let id = _v_8 in
            _menhir_action_14 id
          in
          let id = _v_9 in
          let _v = _menhir_action_07 id in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FETCH ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | END ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ELSE (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_stmts (_menhir_stack, _, body1) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let body2 = _v in
          let _v = _menhir_action_08 body1 body2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | CMD _v_11 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v_11 in
          let _v = _menhir_action_04 c in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v_13 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v_13 in
          let _v = _menhir_action_03 b in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | STR _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_02 s in
          _menhir_run_25_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | PRINT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v in
          let _v = _menhir_action_06 prnt in
          _menhir_run_25_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v in
          let _v = _menhir_action_05 o in
          _menhir_run_25_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_25_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let id = _v in
            _menhir_action_14 id
          in
          let id = _v in
          let _v = _menhir_action_07 id in
          _menhir_run_25_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FETCH ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | CMD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v in
          let _v = _menhir_action_04 c in
          _menhir_run_25_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v in
          let _v = _menhir_action_03 b in
          _menhir_run_25_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
