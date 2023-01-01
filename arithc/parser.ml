
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | STR of (
# 9 "parser.mly"
       (string)
# 11 "parser.ml"
  )
    | PRINT of (
# 14 "parser.mly"
       (Ast.print)
# 16 "parser.ml"
  )
    | OPS of (
# 13 "parser.mly"
       (Ast.operation)
# 21 "parser.ml"
  )
    | INT of (
# 8 "parser.mly"
       (int)
# 26 "parser.ml"
  )
    | IF
    | IDENT of (
# 10 "parser.mly"
       (string)
# 32 "parser.ml"
  )
    | EOF
    | END
    | ELSE
    | CMD of (
# 12 "parser.mly"
       (Ast.command)
# 40 "parser.ml"
  )
    | BOOL of (
# 11 "parser.mly"
       (bool)
# 45 "parser.ml"
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
  | MenhirState13
  | MenhirState10
  | MenhirState5
  | MenhirState0

# 4 "parser.mly"
  
  open Ast

# 72 "parser.ml"

let rec _menhir_goto_stmts : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmts -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv57 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | CMD _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState13 in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s, (p : 'tv_stmts)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 22 "parser.mly"
      (Ast.program)
# 98 "parser.ml"
        ) = 
# 27 "parser.mly"
                ( List.rev p )
# 102 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv51) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 22 "parser.mly"
      (Ast.program)
# 110 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 22 "parser.mly"
      (Ast.program)
# 118 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 22 "parser.mly"
      (Ast.program)
# 126 "parser.ml"
        )) : (
# 22 "parser.mly"
      (Ast.program)
# 130 "parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv48)) : 'freshtv50)) : 'freshtv52)) : 'freshtv54)) : 'freshtv56)
    | IDENT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | IF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | INT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | OPS _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | PRINT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | STR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13) : 'freshtv58)

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv29 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ELSE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv25 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BOOL _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
            | CMD _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
            | IDENT _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
            | IF ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | INT _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
            | OPS _v ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
            | PRINT _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
            | STR _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10) : 'freshtv26)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv27 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)) : 'freshtv30)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv37 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv33 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv31 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (body1 : 'tv_expr)), _, (body2 : 'tv_expr)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_expr = 
# 49 "parser.mly"
                                               ( If (body1, body2) )
# 212 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv32)) : 'freshtv34)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv35 * _menhir_state) * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)) : 'freshtv38)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv41 * _menhir_state * 'tv_stmts) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv39 * _menhir_state * 'tv_stmts) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (l : 'tv_stmts)), _, (i : 'tv_expr)) = _menhir_stack in
        let _v : 'tv_stmts = 
# 31 "parser.mly"
                     ( i :: l )
# 231 "parser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv40)) : 'freshtv42)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (i : 'tv_expr)) = _menhir_stack in
        let _v : 'tv_stmts = 
# 30 "parser.mly"
                     ( [i] )
# 243 "parser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv44)) : 'freshtv46)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv19 * _menhir_state) * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv24)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (string)
# 273 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv15) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : (
# 9 "parser.mly"
       (string)
# 283 "parser.ml"
    )) : (
# 9 "parser.mly"
       (string)
# 287 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 43 "parser.mly"
                                               ( Str  s )
# 292 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv16)

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "parser.mly"
       (Ast.print)
# 299 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((prnt : (
# 14 "parser.mly"
       (Ast.print)
# 309 "parser.ml"
    )) : (
# 14 "parser.mly"
       (Ast.print)
# 313 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 48 "parser.mly"
                                               ( Print prnt)
# 318 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv14)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "parser.mly"
       (Ast.operation)
# 325 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((o : (
# 13 "parser.mly"
       (Ast.operation)
# 335 "parser.ml"
    )) : (
# 13 "parser.mly"
       (Ast.operation)
# 339 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 47 "parser.mly"
                                               ( Ops o  )
# 344 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv12)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (int)
# 351 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 8 "parser.mly"
       (int)
# 361 "parser.ml"
    )) : (
# 8 "parser.mly"
       (int)
# 365 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 42 "parser.mly"
                                               ( Int  i )
# 370 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv10)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | CMD _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | IDENT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | IF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | INT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | OPS _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | PRINT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | STR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 10 "parser.mly"
       (string)
# 404 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((id : (
# 10 "parser.mly"
       (string)
# 414 "parser.ml"
    )) : (
# 10 "parser.mly"
       (string)
# 418 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 45 "parser.mly"
                                               ( Str id )
# 423 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv8)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "parser.mly"
       (Ast.command)
# 430 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((c : (
# 12 "parser.mly"
       (Ast.command)
# 440 "parser.ml"
    )) : (
# 12 "parser.mly"
       (Ast.command)
# 444 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 46 "parser.mly"
                                               ( Cmd c  )
# 449 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv6)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (bool)
# 456 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((b : (
# 11 "parser.mly"
       (bool)
# 466 "parser.ml"
    )) : (
# 11 "parser.mly"
       (bool)
# 470 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 44 "parser.mly"
                                               ( Bool b )
# 475 "parser.ml"
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
# 494 "parser.ml"
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
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | CMD _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IDENT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | OPS _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | PRINT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | STR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 269 "<standard.mly>"
  

# 537 "parser.ml"
