
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
    | LET
    | INT of (
# 8 "parser.mly"
       (int)
# 29 "parser.ml"
  )
    | IN
    | IF
    | IDENT of (
# 10 "parser.mly"
       (string)
# 36 "parser.ml"
  )
    | FETCH
    | EOF
    | END
    | ELSE
    | CMD of (
# 12 "parser.mly"
       (Ast.command)
# 45 "parser.ml"
  )
    | BOOL of (
# 11 "parser.mly"
       (bool)
# 50 "parser.ml"
  )
    | ATR
  
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
  | MenhirState33
  | MenhirState31
  | MenhirState30
  | MenhirState29
  | MenhirState27
  | MenhirState21
  | MenhirState20
  | MenhirState18
  | MenhirState13
  | MenhirState11
  | MenhirState6
  | MenhirState3
  | MenhirState1
  | MenhirState0

# 4 "parser.mly"
  
  open Ast

# 88 "parser.ml"

let rec _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_stmts : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmts -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv89 * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOL _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
        | CMD _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
        | ELSE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv83 * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState18 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL _v ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | CMD _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | FETCH ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | IF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | INT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | LET ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState20
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20) : 'freshtv84)
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv87 * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState18 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv85 * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (body1 : 'tv_stmts)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 47 "parser.mly"
                                               ( Ifthen (body1) )
# 159 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv86)) : 'freshtv88)
        | FETCH ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState18
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
        | IF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState18
        | INT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
        | LET ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState18
        | OPS _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
        | PRINT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
        | PROC ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState18
        | STR _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
        | WHILE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState18
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18) : 'freshtv90)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv95 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOL _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | CMD _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv93 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState21 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv91 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (body1 : 'tv_stmts)), _), _, (body2 : 'tv_stmts)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 46 "parser.mly"
                                               ( Ifelse (body1, body2) )
# 211 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv92)) : 'freshtv94)
        | FETCH ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | IF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | INT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | LET ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | OPS _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | PRINT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | PROC ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | STR _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | WHILE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21) : 'freshtv96)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv101 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOL _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | CMD _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv99 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState27 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv97 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _, (name : 'tv_ident)), _, (body : 'tv_stmts)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 49 "parser.mly"
                                               ( Proc (name, body) )
# 263 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv98)) : 'freshtv100)
        | FETCH ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState27
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | IF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState27
        | INT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | LET ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState27
        | OPS _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | PRINT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | PROC ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState27
        | STR _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
        | WHILE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState27
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27) : 'freshtv102)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv105 * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOL _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | CMD _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | FETCH ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | IF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | IN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv103 * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState29 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL _v ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
            | CMD _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
            | FETCH ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
            | IF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | INT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
            | LET ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | OPS _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
            | PRINT _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
            | PROC ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | STR _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
            | WHILE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30) : 'freshtv104)
        | INT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | LET ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | OPS _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | PRINT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | PROC ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | STR _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | WHILE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29) : 'freshtv106)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv111 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOL _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | CMD _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv109 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState31 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv107 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (cond : 'tv_stmts)), _), _, (body : 'tv_stmts)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 48 "parser.mly"
                                               ( While (cond, body) )
# 385 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv108)) : 'freshtv110)
        | FETCH ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | IF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | INT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | LET ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | OPS _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | PRINT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | PROC ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | STR _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | WHILE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31) : 'freshtv112)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv123 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOL _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | CMD _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv121 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState33 in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv119 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (_menhir_stack, _menhir_s, (p : 'tv_stmts)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 23 "parser.mly"
      (Ast.program)
# 434 "parser.ml"
            ) = 
# 28 "parser.mly"
                ( List.rev p )
# 438 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv117) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 23 "parser.mly"
      (Ast.program)
# 446 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv115) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 23 "parser.mly"
      (Ast.program)
# 454 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv113) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 23 "parser.mly"
      (Ast.program)
# 462 "parser.ml"
            )) : (
# 23 "parser.mly"
      (Ast.program)
# 466 "parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv114)) : 'freshtv116)) : 'freshtv118)) : 'freshtv120)) : 'freshtv122)
        | FETCH ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | IDENT _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | IF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | INT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | LET ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | OPS _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | PRINT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | PROC ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | STR _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | WHILE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33) : 'freshtv124)
    | _ ->
        _menhir_fail ()

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState33 | MenhirState29 | MenhirState31 | MenhirState27 | MenhirState18 | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((i : 'tv_expr) : 'tv_expr) = _v in
        ((let (_menhir_stack, _menhir_s, (l : 'tv_stmts)) = _menhir_stack in
        let _v : 'tv_stmts = 
# 32 "parser.mly"
                     ( i :: l )
# 512 "parser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv72)) : 'freshtv74)
    | MenhirState0 | MenhirState1 | MenhirState30 | MenhirState6 | MenhirState13 | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((i : 'tv_expr) : 'tv_expr) = _v in
        ((let _v : 'tv_stmts = 
# 31 "parser.mly"
                     ( [i] )
# 527 "parser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv76)) : 'freshtv78)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv81 * _menhir_state) * (
# 10 "parser.mly"
       (string)
# 535 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv79 * _menhir_state) * (
# 10 "parser.mly"
       (string)
# 543 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((e : 'tv_expr) : 'tv_expr) = _v in
        ((let ((_menhir_stack, _menhir_s), (id : (
# 10 "parser.mly"
       (string)
# 550 "parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_expr = 
# 50 "parser.mly"
                                               ( Let (id,e) )
# 557 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv80)) : 'freshtv82)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv45 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv47 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv49 * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv51 * _menhir_state) * _menhir_state * 'tv_ident)) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv53 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv55 * _menhir_state) * _menhir_state * 'tv_stmts) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv57 * _menhir_state) * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv61 * _menhir_state) * (
# 10 "parser.mly"
       (string)
# 616 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv63 * _menhir_state) * _menhir_state * 'tv_ident)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv70)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | CMD _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | FETCH ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | IF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | INT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState1
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
# 678 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv41) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : (
# 9 "parser.mly"
       (string)
# 688 "parser.ml"
    )) : (
# 9 "parser.mly"
       (string)
# 692 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 40 "parser.mly"
                                               ( Str  s )
# 697 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv42)

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
# 717 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv39) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((prnt : (
# 14 "parser.mly"
       (Ast.print)
# 727 "parser.ml"
    )) : (
# 14 "parser.mly"
       (Ast.print)
# 731 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 44 "parser.mly"
                                               ( Print prnt)
# 736 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv40)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "parser.mly"
       (Ast.operation)
# 743 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv37) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((o : (
# 13 "parser.mly"
       (Ast.operation)
# 753 "parser.ml"
    )) : (
# 13 "parser.mly"
       (Ast.operation)
# 757 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 43 "parser.mly"
                                               ( Ops o  )
# 762 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv38)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 10 "parser.mly"
       (string)
# 778 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ATR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv29 * _menhir_state) * (
# 10 "parser.mly"
       (string)
# 789 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL _v ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
            | CMD _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
            | FETCH ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
            | IF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | INT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
            | LET ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | OPS _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
            | PRINT _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
            | PROC ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | STR _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
            | WHILE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv30)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv31 * _menhir_state) * (
# 10 "parser.mly"
       (string)
# 829 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)) : 'freshtv34)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (int)
# 844 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 8 "parser.mly"
       (int)
# 854 "parser.ml"
    )) : (
# 8 "parser.mly"
       (int)
# 858 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 39 "parser.mly"
                                               ( Int  i )
# 863 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv28)

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | CMD _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | FETCH ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | IF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | INT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState13
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 10 "parser.mly"
       (string)
# 905 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((id : (
# 10 "parser.mly"
       (string)
# 915 "parser.ml"
    )) : (
# 10 "parser.mly"
       (string)
# 919 "parser.ml"
    )) = _v in
    ((let _v : 'tv_ident = 
# 36 "parser.mly"
             ( id )
# 924 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv23) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ident) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv17 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv13 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL _v ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | CMD _v ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | FETCH ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | IDENT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | IF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | INT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | LET ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6) : 'freshtv14)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv15 * _menhir_state) * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)) : 'freshtv18)
    | MenhirState0 | MenhirState33 | MenhirState1 | MenhirState29 | MenhirState30 | MenhirState31 | MenhirState6 | MenhirState27 | MenhirState11 | MenhirState13 | MenhirState18 | MenhirState20 | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state * 'tv_ident) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (id : 'tv_ident)) = _menhir_stack in
        let _v : 'tv_expr = 
# 45 "parser.mly"
                                               ( Ident id )
# 988 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv20)) : 'freshtv22)) : 'freshtv24)) : 'freshtv26)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 10 "parser.mly"
       (string)
# 1004 "parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7 * _menhir_state) = Obj.magic _menhir_stack in
        let ((id : (
# 10 "parser.mly"
       (string)
# 1012 "parser.ml"
        )) : (
# 10 "parser.mly"
       (string)
# 1016 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_expr = 
# 51 "parser.mly"
                                               ( Fetch (id) )
# 1023 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv8)) : 'freshtv10)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "parser.mly"
       (Ast.command)
# 1037 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((c : (
# 12 "parser.mly"
       (Ast.command)
# 1047 "parser.ml"
    )) : (
# 12 "parser.mly"
       (Ast.command)
# 1051 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 42 "parser.mly"
                                               ( Cmd c  )
# 1056 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv6)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (bool)
# 1063 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((b : (
# 11 "parser.mly"
       (bool)
# 1073 "parser.ml"
    )) : (
# 11 "parser.mly"
       (bool)
# 1077 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 41 "parser.mly"
                                               ( Bool b )
# 1082 "parser.ml"
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
# 23 "parser.mly"
      (Ast.program)
# 1101 "parser.ml"
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
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | CMD _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | FETCH ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | IDENT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | LET ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0
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
  

# 1152 "parser.ml"
