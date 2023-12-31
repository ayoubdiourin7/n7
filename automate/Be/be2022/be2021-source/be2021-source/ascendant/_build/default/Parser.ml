
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | UL_PV
    | UL_NAME of (
# 15 "Parser.mly"
       (string)
# 16 "Parser.ml"
  )
    | UL_INT of (
# 16 "Parser.mly"
       (int)
# 21 "Parser.ml"
  )
    | UL_IDENT of (
# 14 "Parser.mly"
       (string)
# 26 "Parser.ml"
  )
    | UL_FIN
    | UL_AFF
    | UL_ACO
    | UL_ACF
  
end

include MenhirBasics

# 1 "Parser.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)


# 45 "Parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_record) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: record. *)

  | MenhirState03 : (('s, _menhir_box_record) _menhir_cell1_UL_ACO, _menhir_box_record) _menhir_state
    (** State 03.
        Stack shape : UL_ACO.
        Start symbol: record. *)

  | MenhirState05 : (('s, _menhir_box_record) _menhir_cell1_UL_NAME, _menhir_box_record) _menhir_state
    (** State 05.
        Stack shape : UL_NAME.
        Start symbol: record. *)

  | MenhirState07 : ((('s, _menhir_box_record) _menhir_cell1_UL_NAME, _menhir_box_record) _menhir_cell1_valeur, _menhir_box_record) _menhir_state
    (** State 07.
        Stack shape : UL_NAME valeur.
        Start symbol: record. *)


and ('s, 'r) _menhir_cell1_valeur = 
  | MenhirCell1_valeur of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_UL_ACO = 
  | MenhirCell1_UL_ACO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UL_NAME = 
  | MenhirCell1_UL_NAME of 's * ('s, 'r) _menhir_state * (
# 15 "Parser.mly"
       (string)
# 79 "Parser.ml"
)

and _menhir_box_record = 
  | MenhirBox_record of (unit) [@@unboxed]

let _menhir_action_1 =
  fun () ->
    (
# 45 "Parser.mly"
                              ( (print_endline "champ : UL_NAME UL_AFF valeur") )
# 90 "Parser.ml"
     : (unit))

let _menhir_action_2 =
  fun () ->
    (
# 46 "Parser.mly"
                                          ( (print_endline "champ : UL_NAME UL_AFF valeur UL_PV champ") )
# 98 "Parser.ml"
     : (unit))

let _menhir_action_3 =
  fun () ->
    (
# 38 "Parser.mly"
                       ( (print_endline "record : valeur UL_FIN") )
# 106 "Parser.ml"
     : (unit))

let _menhir_action_4 =
  fun () ->
    (
# 40 "Parser.mly"
                       ( (print_endline "valeur : UL_ACO UL_ACF") )
# 114 "Parser.ml"
     : (unit))

let _menhir_action_5 =
  fun () ->
    (
# 41 "Parser.mly"
                              ( (print_endline "valeur : UL_ACO champ UL_ACF") )
# 122 "Parser.ml"
     : (unit))

let _menhir_action_6 =
  fun () ->
    (
# 42 "Parser.mly"
                 ( (print_endline "valeur : UL_IDENT") )
# 130 "Parser.ml"
     : (unit))

let _menhir_action_7 =
  fun () ->
    (
# 43 "Parser.mly"
                 ( (print_endline "valeur : UL_INT") )
# 138 "Parser.ml"
     : (unit))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | UL_ACF ->
        "UL_ACF"
    | UL_ACO ->
        "UL_ACO"
    | UL_AFF ->
        "UL_AFF"
    | UL_FIN ->
        "UL_FIN"
    | UL_IDENT _ ->
        "UL_IDENT"
    | UL_INT _ ->
        "UL_INT"
    | UL_NAME _ ->
        "UL_NAME"
    | UL_PV ->
        "UL_PV"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_12 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_record =
    fun _menhir_stack _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_FIN ->
          let _v = _menhir_action_3 () in
          MenhirBox_record _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_record) _menhir_state -> _menhir_box_record =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_7 () in
      _menhir_goto_valeur _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_valeur : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_record) _menhir_state -> _ -> _menhir_box_record =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_12 _menhir_stack _tok
      | MenhirState05 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_06 : type  ttv_stack. ((ttv_stack, _menhir_box_record) _menhir_cell1_UL_NAME as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_record) _menhir_state -> _ -> _menhir_box_record =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_PV ->
          let _menhir_stack = MenhirCell1_valeur (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState07 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_NAME _v ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | UL_ACF ->
          let MenhirCell1_UL_NAME (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let _ = _menhir_action_1 () in
          _menhir_goto_champ _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_record) _menhir_state -> _menhir_box_record =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_NAME (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_AFF ->
          let _menhir_s = MenhirState05 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_INT _ ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | UL_IDENT _ ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | UL_ACO ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_record) _menhir_state -> _menhir_box_record =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_6 () in
      _menhir_goto_valeur _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_record) _menhir_state -> _menhir_box_record =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_NAME _v ->
          let _menhir_stack = MenhirCell1_UL_ACO (_menhir_stack, _menhir_s) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03
      | UL_ACF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_4 () in
          _menhir_goto_valeur _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_champ : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_record) _menhir_state -> _menhir_box_record =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState03 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_10 : type  ttv_stack. (ttv_stack, _menhir_box_record) _menhir_cell1_UL_ACO -> _ -> _ -> _menhir_box_record =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_UL_ACO (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_5 () in
      _menhir_goto_valeur _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_08 : type  ttv_stack. ((ttv_stack, _menhir_box_record) _menhir_cell1_UL_NAME, _menhir_box_record) _menhir_cell1_valeur -> _ -> _ -> _menhir_box_record =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_valeur (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_UL_NAME (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_2 () in
      _menhir_goto_champ _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_record =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState00 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_INT _ ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | UL_IDENT _ ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | UL_ACO ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
end

let record =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_record v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 48 "Parser.mly"
  

# 303 "Parser.ml"
