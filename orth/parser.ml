
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
    | INT of (
# 8 "parser.mly"
       (int)
# 32 "parser.ml"
  )
    | IN
    | IF
    | IDENT of (
# 10 "parser.mly"
       (string)
# 39 "parser.ml"
  )
    | EOF
    | END
    | ELSE
    | CMD of (
# 12 "parser.mly"
       (Ast.command)
# 47 "parser.ml"
  )
    | BOOL of (
# 11 "parser.mly"
       (bool)
# 52 "parser.ml"
  )
  
end

include MenhirBasics

# 4 "parser.mly"
  
  open Ast

# 63 "parser.ml"

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

  | MenhirState07 : (('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_state
    (** State 07.
        Stack shape : IF.
        Start symbol: prog. *)

  | MenhirState11 : ((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_state
    (** State 11.
        Stack shape : IF stmts.
        Start symbol: prog. *)

  | MenhirState13 : (((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_ELSE, _menhir_box_prog) _menhir_state
    (** State 13.
        Stack shape : IF stmts ELSE.
        Start symbol: prog. *)

  | MenhirState14 : ((((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_ELSE, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_state
    (** State 14.
        Stack shape : IF stmts ELSE stmts.
        Start symbol: prog. *)

  | MenhirState19 : ((('s, _menhir_box_prog) _menhir_cell1_PROC, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_state
    (** State 19.
        Stack shape : PROC stmts.
        Start symbol: prog. *)

  | MenhirState21 : ((('s, _menhir_box_prog) _menhir_cell1_WHILE, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_state
    (** State 21.
        Stack shape : WHILE stmts.
        Start symbol: prog. *)

  | MenhirState22 : (((('s, _menhir_box_prog) _menhir_cell1_WHILE, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_state
    (** State 22.
        Stack shape : WHILE stmts IN.
        Start symbol: prog. *)

  | MenhirState23 : ((((('s, _menhir_box_prog) _menhir_cell1_WHILE, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_IN, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_state
    (** State 23.
        Stack shape : WHILE stmts IN stmts.
        Start symbol: prog. *)

  | MenhirState25 : (('s, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_state
    (** State 25.
        Stack shape : stmts.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_stmts = 
  | MenhirCell1_stmts of 's * ('s, 'r) _menhir_state * (Ast.expr list)

and ('s, 'r) _menhir_cell1_ELSE = 
  | MenhirCell1_ELSE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IN = 
  | MenhirCell1_IN of 's * ('s, 'r) _menhir_state

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
# 153 "parser.ml"
     : (Ast.expr))

let _menhir_action_02 =
  fun s ->
    (
# 40 "parser.mly"
                                               ( Str  s )
# 161 "parser.ml"
     : (Ast.expr))

let _menhir_action_03 =
  fun b ->
    (
# 41 "parser.mly"
                                               ( Bool b )
# 169 "parser.ml"
     : (Ast.expr))

let _menhir_action_04 =
  fun c ->
    (
# 42 "parser.mly"
                                               ( Cmd c  )
# 177 "parser.ml"
     : (Ast.expr))

let _menhir_action_05 =
  fun o ->
    (
# 43 "parser.mly"
                                               ( Ops o  )
# 185 "parser.ml"
     : (Ast.expr))

let _menhir_action_06 =
  fun prnt ->
    (
# 44 "parser.mly"
                                               ( Print prnt)
# 193 "parser.ml"
     : (Ast.expr))

let _menhir_action_07 =
  fun id ->
    (
# 45 "parser.mly"
                                               ( Ident id )
# 201 "parser.ml"
     : (Ast.expr))

let _menhir_action_08 =
  fun body1 body2 ->
    (
# 46 "parser.mly"
                                               ( Ifelse (body1, body2) )
# 209 "parser.ml"
     : (Ast.expr))

let _menhir_action_09 =
  fun body1 ->
    (
# 47 "parser.mly"
                                               ( Ifelse (body1, []) )
# 217 "parser.ml"
     : (Ast.expr))

let _menhir_action_10 =
  fun body cond ->
    (
# 48 "parser.mly"
                                               ( While (cond, body) )
# 225 "parser.ml"
     : (Ast.expr))

let _menhir_action_11 =
  fun body ->
    (
# 49 "parser.mly"
                                               ( Proc (body) )
# 233 "parser.ml"
     : (Ast.expr))

let _menhir_action_12 =
  fun id ->
    (
# 36 "parser.mly"
             ( id )
# 241 "parser.ml"
     : (string))

let _menhir_action_13 =
  fun p ->
    (
# 28 "parser.mly"
                ( List.rev p )
# 249 "parser.ml"
     : (Ast.program))

let _menhir_action_14 =
  fun i ->
    (
# 31 "parser.mly"
                     ( [i] )
# 257 "parser.ml"
     : (Ast.expr list))

let _menhir_action_15 =
  fun i l ->
    (
# 32 "parser.mly"
                     ( i :: l )
# 265 "parser.ml"
     : (Ast.expr list))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
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
    | IDENT _ ->
        "IDENT"
    | IF ->
        "IF"
    | IN ->
        "IN"
    | INT _ ->
        "INT"
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
          _menhir_run_18_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | PRINT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v in
          let _v = _menhir_action_06 prnt in
          _menhir_run_18_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v in
          let _v = _menhir_action_05 o in
          _menhir_run_18_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_18_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let id = _v in
            _menhir_action_12 id
          in
          let id = _v in
          let _v = _menhir_action_07 id in
          _menhir_run_18_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | CMD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v in
          let _v = _menhir_action_04 c in
          _menhir_run_18_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v in
          let _v = _menhir_action_03 b in
          _menhir_run_18_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_18_spec_01 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_WHILE -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let i = _v in
      let _v = _menhir_action_14 i in
      _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
  
  and _menhir_run_21 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | STR _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v_0 in
          let _v = _menhir_action_02 s in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | PRINT _v_2 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v_2 in
          let _v = _menhir_action_06 prnt in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v_4 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v_4 in
          let _v = _menhir_action_05 o in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | INT _v_6 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_6 in
          let _v = _menhir_action_01 i in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IN ->
          let _menhir_stack = MenhirCell1_IN (_menhir_stack, MenhirState21) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | STR _v_8 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v_8 in
              let _v = _menhir_action_02 s in
              _menhir_run_18_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | PRINT _v_10 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let prnt = _v_10 in
              let _v = _menhir_action_06 prnt in
              _menhir_run_18_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | OPS _v_12 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let o = _v_12 in
              let _v = _menhir_action_05 o in
              _menhir_run_18_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | INT _v_14 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_14 in
              let _v = _menhir_action_01 i in
              _menhir_run_18_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | IDENT _v_16 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_17 =
                let id = _v_16 in
                _menhir_action_12 id
              in
              let id = _v_17 in
              let _v = _menhir_action_07 id in
              _menhir_run_18_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | CMD _v_19 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let c = _v_19 in
              let _v = _menhir_action_04 c in
              _menhir_run_18_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | BOOL _v_21 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let b = _v_21 in
              let _v = _menhir_action_03 b in
              _menhir_run_18_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | IF ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | IDENT _v_23 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_24 =
            let id = _v_23 in
            _menhir_action_12 id
          in
          let id = _v_24 in
          let _v = _menhir_action_07 id in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | CMD _v_26 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v_26 in
          let _v = _menhir_action_04 c in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v_28 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v_28 in
          let _v = _menhir_action_03 b in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_stmts -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_stmts (_menhir_stack, _menhir_s, l) = _menhir_stack in
      let i = _v in
      let _v = _menhir_action_15 i l in
      _menhir_goto_stmts _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_stmts : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState03 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_25 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | STR _v_0 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v_0 in
          let _v = _menhir_action_02 s in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | PRINT _v_2 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v_2 in
          let _v = _menhir_action_06 prnt in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v_4 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v_4 in
          let _v = _menhir_action_05 o in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | INT _v_6 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_6 in
          let _v = _menhir_action_01 i in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | IDENT _v_8 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_9 =
            let id = _v_8 in
            _menhir_action_12 id
          in
          let id = _v_9 in
          let _v = _menhir_action_07 id in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | EOF ->
          let p = _v in
          let _v = _menhir_action_13 p in
          MenhirBox_prog _v
      | CMD _v_11 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v_11 in
          let _v = _menhir_action_04 c in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v_13 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v_13 in
          let _v = _menhir_action_03 b in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PROC (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | STR _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_02 s in
          _menhir_run_18_spec_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | PRINT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v in
          let _v = _menhir_action_06 prnt in
          _menhir_run_18_spec_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v in
          let _v = _menhir_action_05 o in
          _menhir_run_18_spec_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_18_spec_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let id = _v in
            _menhir_action_12 id
          in
          let id = _v in
          let _v = _menhir_action_07 id in
          _menhir_run_18_spec_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | CMD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v in
          let _v = _menhir_action_04 c in
          _menhir_run_18_spec_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v in
          let _v = _menhir_action_03 b in
          _menhir_run_18_spec_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_18_spec_03 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_PROC -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let i = _v in
      let _v = _menhir_action_14 i in
      _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
  
  and _menhir_run_19 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_PROC as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | STR _v_0 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v_0 in
          let _v = _menhir_action_02 s in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | PRINT _v_2 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v_2 in
          let _v = _menhir_action_06 prnt in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v_4 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v_4 in
          let _v = _menhir_action_05 o in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | INT _v_6 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_6 in
          let _v = _menhir_action_01 i in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | IDENT _v_8 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_9 =
            let id = _v_8 in
            _menhir_action_12 id
          in
          let id = _v_9 in
          let _v = _menhir_action_07 id in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | END ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PROC (_menhir_stack, _menhir_s) = _menhir_stack in
          let body = _v in
          let _v = _menhir_action_11 body in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | CMD _v_11 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v_11 in
          let _v = _menhir_action_04 c in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v_13 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v_13 in
          let _v = _menhir_action_03 b in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | STR _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_02 s in
          _menhir_run_18_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | PRINT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v in
          let _v = _menhir_action_06 prnt in
          _menhir_run_18_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v in
          let _v = _menhir_action_05 o in
          _menhir_run_18_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_18_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let id = _v in
            _menhir_action_12 id
          in
          let id = _v in
          let _v = _menhir_action_07 id in
          _menhir_run_18_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | CMD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v in
          let _v = _menhir_action_04 c in
          _menhir_run_18_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v in
          let _v = _menhir_action_03 b in
          _menhir_run_18_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_18_spec_07 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_IF -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let i = _v in
      let _v = _menhir_action_14 i in
      _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07 _tok
  
  and _menhir_run_11 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | STR _v_0 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v_0 in
          let _v = _menhir_action_02 s in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | PRINT _v_2 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v_2 in
          let _v = _menhir_action_06 prnt in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v_4 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v_4 in
          let _v = _menhir_action_05 o in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | INT _v_6 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_6 in
          let _v = _menhir_action_01 i in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | IDENT _v_8 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_9 =
            let id = _v_8 in
            _menhir_action_12 id
          in
          let id = _v_9 in
          let _v = _menhir_action_07 id in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | END ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let body1 = _v in
          let _v = _menhir_action_09 body1 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | ELSE ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell1_ELSE (_menhir_stack, MenhirState11) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | WHILE ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
          | STR _v_11 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let s = _v_11 in
              let _v = _menhir_action_02 s in
              _menhir_run_18_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PROC ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
          | PRINT _v_13 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let prnt = _v_13 in
              let _v = _menhir_action_06 prnt in
              _menhir_run_18_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | OPS _v_15 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let o = _v_15 in
              let _v = _menhir_action_05 o in
              _menhir_run_18_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | INT _v_17 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_17 in
              let _v = _menhir_action_01 i in
              _menhir_run_18_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
          | IDENT _v_19 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_20 =
                let id = _v_19 in
                _menhir_action_12 id
              in
              let id = _v_20 in
              let _v = _menhir_action_07 id in
              _menhir_run_18_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | CMD _v_22 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let c = _v_22 in
              let _v = _menhir_action_04 c in
              _menhir_run_18_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | BOOL _v_24 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let b = _v_24 in
              let _v = _menhir_action_03 b in
              _menhir_run_18_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | CMD _v_26 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v_26 in
          let _v = _menhir_action_04 c in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v_28 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v_28 in
          let _v = _menhir_action_03 b in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_18_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState01 ->
          _menhir_run_18_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState22 ->
          _menhir_run_18_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState03 ->
          _menhir_run_18_spec_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState07 ->
          _menhir_run_18_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState13 ->
          _menhir_run_18_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState25 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState21 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState23 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState19 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState11 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState14 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_18_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let i = _v in
      let _v = _menhir_action_14 i in
      _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
  
  and _menhir_run_18_spec_22 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_WHILE, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_IN -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let i = _v in
      let _v = _menhir_action_14 i in
      _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
  
  and _menhir_run_23 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_WHILE, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
      | STR _v_0 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v_0 in
          let _v = _menhir_action_02 s in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
      | PRINT _v_2 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v_2 in
          let _v = _menhir_action_06 prnt in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v_4 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v_4 in
          let _v = _menhir_action_05 o in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | INT _v_6 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_6 in
          let _v = _menhir_action_01 i in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
      | IDENT _v_8 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_9 =
            let id = _v_8 in
            _menhir_action_12 id
          in
          let id = _v_9 in
          let _v = _menhir_action_07 id in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
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
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v_13 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v_13 in
          let _v = _menhir_action_03 b in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_18_spec_13 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_ELSE -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let i = _v in
      let _v = _menhir_action_14 i in
      _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
  
  and _menhir_run_14 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_stmts, _menhir_box_prog) _menhir_cell1_ELSE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | STR _v_0 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v_0 in
          let _v = _menhir_action_02 s in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | PRINT _v_2 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v_2 in
          let _v = _menhir_action_06 prnt in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v_4 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v_4 in
          let _v = _menhir_action_05 o in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | INT _v_6 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v_6 in
          let _v = _menhir_action_01 i in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | IDENT _v_8 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_9 =
            let id = _v_8 in
            _menhir_action_12 id
          in
          let id = _v_9 in
          let _v = _menhir_action_07 id in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
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
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v_13 ->
          let _menhir_stack = MenhirCell1_stmts (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v_13 in
          let _v = _menhir_action_03 b in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
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
          _menhir_run_18_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PROC ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | PRINT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let prnt = _v in
          let _v = _menhir_action_06 prnt in
          _menhir_run_18_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | OPS _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let o = _v in
          let _v = _menhir_action_05 o in
          _menhir_run_18_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_18_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let id = _v in
            _menhir_action_12 id
          in
          let id = _v in
          let _v = _menhir_action_07 id in
          _menhir_run_18_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | CMD _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let c = _v in
          let _v = _menhir_action_04 c in
          _menhir_run_18_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let b = _v in
          let _v = _menhir_action_03 b in
          _menhir_run_18_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
