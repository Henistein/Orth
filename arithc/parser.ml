
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | TIMES
    | STR of (
# 9 "parser.mly"
       (string)
# 12 "parser.ml"
  )
    | PLUS
    | MINUS
    | INT of (
# 8 "parser.mly"
       (int)
# 19 "parser.ml"
  )
    | IDENT of (
# 10 "parser.mly"
       (string)
# 24 "parser.ml"
  )
    | EQ
    | EOF
    | DIV
    | CMD of (
# 12 "parser.mly"
       (Ast.command)
# 32 "parser.ml"
  )
    | BOOL of (
# 11 "parser.mly"
       (bool)
# 37 "parser.ml"
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
  | MenhirState6
  | MenhirState0

# 4 "parser.mly"
  
  open Ast

# 62 "parser.ml"

let rec _menhir_goto_stmts : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmts -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv35 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | CMD _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState6 in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s, (p : 'tv_stmts)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 28 "parser.mly"
      (Ast.program)
# 88 "parser.ml"
        ) = 
# 33 "parser.mly"
                ( List.rev p )
# 92 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 28 "parser.mly"
      (Ast.program)
# 100 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 28 "parser.mly"
      (Ast.program)
# 108 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 28 "parser.mly"
      (Ast.program)
# 116 "parser.ml"
        )) : (
# 28 "parser.mly"
      (Ast.program)
# 120 "parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv26)) : 'freshtv28)) : 'freshtv30)) : 'freshtv32)) : 'freshtv34)
    | IDENT _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | INT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | STR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6) : 'freshtv36)

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((i : 'tv_expr) : 'tv_expr) = _v in
        ((let (_menhir_stack, _menhir_s, (l : 'tv_stmts)) = _menhir_stack in
        let _v : 'tv_stmts = 
# 37 "parser.mly"
                     ( i :: l )
# 150 "parser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv18)) : 'freshtv20)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_expr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((i : 'tv_expr) : 'tv_expr) = _v in
        ((let _v : 'tv_stmts = 
# 36 "parser.mly"
                     ( [i] )
# 165 "parser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v) : 'freshtv22)) : 'freshtv24)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13 * _menhir_state * 'tv_stmts) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv14)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv16)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (string)
# 185 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : (
# 9 "parser.mly"
       (string)
# 195 "parser.ml"
    )) : (
# 9 "parser.mly"
       (string)
# 199 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 49 "parser.mly"
                                               ( Str  s )
# 204 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv12)

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (int)
# 211 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 8 "parser.mly"
       (int)
# 221 "parser.ml"
    )) : (
# 8 "parser.mly"
       (int)
# 225 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 48 "parser.mly"
                                               ( Int  i )
# 230 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv10)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 10 "parser.mly"
       (string)
# 237 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((id : (
# 10 "parser.mly"
       (string)
# 247 "parser.ml"
    )) : (
# 10 "parser.mly"
       (string)
# 251 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 51 "parser.mly"
                                               ( Str id )
# 256 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv8)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "parser.mly"
       (Ast.command)
# 263 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((c : (
# 12 "parser.mly"
       (Ast.command)
# 273 "parser.ml"
    )) : (
# 12 "parser.mly"
       (Ast.command)
# 277 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 52 "parser.mly"
                                               ( Cmd c  )
# 282 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv6)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (bool)
# 289 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((b : (
# 11 "parser.mly"
       (bool)
# 299 "parser.ml"
    )) : (
# 11 "parser.mly"
       (bool)
# 303 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 50 "parser.mly"
                                               ( Bool b )
# 308 "parser.ml"
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
# 28 "parser.mly"
      (Ast.program)
# 327 "parser.ml"
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
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | CMD _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IDENT _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | INT _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | STR _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 269 "<standard.mly>"
  

# 364 "parser.ml"
