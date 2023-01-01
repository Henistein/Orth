
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | WHILE
    | STR of (
# 9 "parser.mly"
       (string)
# 12 "parser.ml"
  )
    | PROC
    | PRINT of (
# 14 "parser.mly"
       (Ast.print)
# 18 "parser.ml"
  )
    | OPS of (
# 13 "parser.mly"
       (Ast.operation)
# 23 "parser.ml"
  )
    | INT of (
# 8 "parser.mly"
       (int)
# 28 "parser.ml"
  )
    | IN
    | IF
    | IDENT of (
# 10 "parser.mly"
       (string)
# 35 "parser.ml"
  )
    | EOF
    | END
    | ELSE
    | CMD of (
# 12 "parser.mly"
       (Ast.command)
# 43 "parser.ml"
  )
    | BOOL of (
# 11 "parser.mly"
       (bool)
# 48 "parser.ml"
  )
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState26
  | MenhirState24
  | MenhirState23
  | MenhirState20
  | MenhirState15
  | MenhirState14
  | MenhirState13
  | MenhirState10
  | MenhirState6
  | MenhirState3
  | MenhirState1
  | MenhirState0

# 4 "parser.mly"
  
  open Ast

# 83 "parser.ml"

let rec _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_stmts : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmts -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69 * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOL _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | CMD _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | ELSE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv67 * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState13 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
            | CMD _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
            | IF ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState14
            | INT _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
            | OPS _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
            | PRINT _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
            | PROC ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState14
            | STR _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
            | WHILE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState14
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14) : 'freshtv68)
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | IF ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | INT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | OPS _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | PRINT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | PROC ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | STR _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
        | WHILE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13) : 'freshtv70)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv75 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOL _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | CMD _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv73 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState15 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv71 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (body1 : 'tv_stmts)), _), _, (body2 : 'tv_stmts)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 45 "parser.mly"
                                               ( If (body1, body2) )
# 181 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv72)) : 'freshtv74)
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | IF ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | INT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | OPS _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | PRINT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | PROC ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | STR _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | WHILE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15) : 'freshtv76)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv81 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOL _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | CMD _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv79 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState20 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv77 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _, (name : 'tv_ident)), _, (body : 'tv_stmts)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 47 "parser.mly"
                                               ( Proc (name, body) )
# 229 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv78)) : 'freshtv80)
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | IF ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | INT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | OPS _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | PRINT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | PROC ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | STR _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | WHILE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20) : 'freshtv82)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv87 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOL _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | CMD _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv85 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState24 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv83 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _, (cond : 'tv_expr)), _, (body : 'tv_stmts)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 46 "parser.mly"
                                               ( While (cond, body) )
# 277 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv84)) : 'freshtv86)
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | IF ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | INT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | OPS _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | PRINT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | PROC ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | STR _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | WHILE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24) : 'freshtv88)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOL _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | CMD _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv97 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState26 in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv95 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (_menhir_stack, _menhir_s, (p : 'tv_stmts)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 22 "parser.mly"
      (Ast.program)
# 322 "parser.ml"
            ) = 
# 27 "parser.mly"
                ( List.rev p )
# 326 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv93) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 22 "parser.mly"
      (Ast.program)
# 334 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv91) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 22 "parser.mly"
      (Ast.program)
# 342 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv89) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 22 "parser.mly"
      (Ast.program)
# 350 "parser.ml"
            )) : (
# 22 "parser.mly"
      (Ast.program)
# 354 "parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv90)) : 'freshtv92)) : 'freshtv94)) : 'freshtv96)) : 'freshtv98)
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | IF ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | INT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | OPS _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | PRINT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | PROC ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | STR _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | WHILE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26) : 'freshtv100)
    | _ ->
        _menhir_fail ()

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState26 | MenhirState24 | MenhirState20 | MenhirState13 | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * 'tv_stmts) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * 'tv_stmts) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (l : 'tv_stmts)), _, (i : 'tv_expr)) = _menhir_stack in
        let _v : 'tv_stmts = 
# 31 "parser.mly"
                     ( i :: l )
# 393 "parser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv54)) : 'freshtv56)
    | MenhirState0 | MenhirState23 | MenhirState6 | MenhirState10 | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (i : 'tv_expr)) = _menhir_stack in
        let _v : 'tv_stmts = 
# 30 "parser.mly"
                     ( [i] )
# 405 "parser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv58)) : 'freshtv60)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv65 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv61 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
            | CMD _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
            | IF ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | INT _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
            | OPS _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
            | PRINT _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
            | PROC ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | STR _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
            | WHILE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23) : 'freshtv62)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv63 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)) : 'freshtv66)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv31 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv33 * _menhir_state) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv35 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv37 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv39 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv41 * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45 * _menhir_state) * _menhir_state * 'tv_ident)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv51) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv52)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | CMD _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | IF ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | INT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | OPS _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | PRINT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | PROC ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | STR _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | WHILE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (string)
# 551 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : (
# 9 "parser.mly"
       (string)
# 561 "parser.ml"
    )) : (
# 9 "parser.mly"
       (string)
# 565 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 39 "parser.mly"
                                               ( Str  s )
# 570 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv28)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "parser.mly"
       (Ast.print)
# 590 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((prnt : (
# 14 "parser.mly"
       (Ast.print)
# 600 "parser.ml"
    )) : (
# 14 "parser.mly"
       (Ast.print)
# 604 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 43 "parser.mly"
                                               ( Print prnt)
# 609 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv26)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "parser.mly"
       (Ast.operation)
# 616 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((o : (
# 13 "parser.mly"
       (Ast.operation)
# 626 "parser.ml"
    )) : (
# 13 "parser.mly"
       (Ast.operation)
# 630 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 42 "parser.mly"
                                               ( Ops o  )
# 635 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv24)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (int)
# 642 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 8 "parser.mly"
       (int)
# 652 "parser.ml"
    )) : (
# 8 "parser.mly"
       (int)
# 656 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 38 "parser.mly"
                                               ( Int  i )
# 661 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv22)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | CMD _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | IF ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | INT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | OPS _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | PRINT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | PROC ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | STR _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | WHILE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 10 "parser.mly"
       (string)
# 699 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv19) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((id : (
# 10 "parser.mly"
       (string)
# 709 "parser.ml"
    )) : (
# 10 "parser.mly"
       (string)
# 713 "parser.ml"
    )) = _v in
    ((let _v : 'tv_ident = 
# 35 "parser.mly"
             ( id )
# 718 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv17) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ident) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv11 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv7 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | CMD _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | IF ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | INT _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | OPS _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | PRINT _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | PROC ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | STR _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | WHILE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6) : 'freshtv8)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv9 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv10)) : 'freshtv12)
    | MenhirState0 | MenhirState26 | MenhirState23 | MenhirState24 | MenhirState1 | MenhirState6 | MenhirState20 | MenhirState10 | MenhirState13 | MenhirState14 | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15 * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13 * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (id : 'tv_ident)) = _menhir_stack in
        let _v : 'tv_expr = 
# 44 "parser.mly"
                                               ( Ident id )
# 778 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv14)) : 'freshtv16)) : 'freshtv18)) : 'freshtv20)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "parser.mly"
       (Ast.command)
# 785 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((c : (
# 12 "parser.mly"
       (Ast.command)
# 795 "parser.ml"
    )) : (
# 12 "parser.mly"
       (Ast.command)
# 799 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 41 "parser.mly"
                                               ( Cmd c  )
# 804 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv6)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (bool)
# 811 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((b : (
# 11 "parser.mly"
       (bool)
# 821 "parser.ml"
    )) : (
# 11 "parser.mly"
       (bool)
# 825 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 40 "parser.mly"
                                               ( Bool b )
# 830 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv4)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and prog : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 22 "parser.mly"
      (Ast.program)
# 849 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | CMD _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | OPS _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | PRINT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | PROC ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | STR _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | WHILE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 269 "<standard.mly>"
  

# 896 "parser.ml"
