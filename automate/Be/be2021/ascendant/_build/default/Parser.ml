
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | UL_VIRGUL
    | UL_TO
    | UL_SYSTEM
    | UL_POINTVIRGUL
    | UL_POINT
    | UL_PARENTOUV
    | UL_PARENTFER
    | UL_OUT
    | UL_MODEL
    | UL_INT
    | UL_IN
    | UL_IDENT_MAJ of (
# 33 "Parser.mly"
       (string)
# 26 "Parser.ml"
  )
    | UL_IDENT of (
# 31 "Parser.mly"
       (string)
# 31 "Parser.ml"
  )
    | UL_FROM
    | UL_FLOW
    | UL_FLOAT
    | UL_FIN
    | UL_ENTIER of (
# 32 "Parser.mly"
       (int)
# 40 "Parser.ml"
  )
    | UL_DEUXPOINT
    | UL_CROCHOUV
    | UL_CROCHFER
    | UL_BOOLEAN
    | UL_BLOCK
    | UL_ACCOUV
    | UL_ACCFER
  
end

include MenhirBasics

# 1 "Parser.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)


# 62 "Parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState03 : ('s _menhir_cell0_UL_IDENT_MAJ, _menhir_box_modele) _menhir_state
    (** State 03.
        Stack shape : UL_IDENT_MAJ.
        Start symbol: modele. *)

  | MenhirState05 : (('s, _menhir_box_modele) _menhir_cell1_UL_SYSTEM _menhir_cell0_UL_IDENT_MAJ, _menhir_box_modele) _menhir_state
    (** State 05.
        Stack shape : UL_SYSTEM UL_IDENT_MAJ.
        Start symbol: modele. *)

  | MenhirState06 : (('s _menhir_cell0_UL_IDENT_MAJ, _menhir_box_modele) _menhir_cell1_UL_PARENTOUV, _menhir_box_modele) _menhir_state
    (** State 06.
        Stack shape : UL_IDENT_MAJ UL_PARENTOUV.
        Start symbol: modele. *)

  | MenhirState09 : (('s, _menhir_box_modele) _menhir_cell1_UL_IDENT, _menhir_box_modele) _menhir_state
    (** State 09.
        Stack shape : UL_IDENT.
        Start symbol: modele. *)

  | MenhirState22 : (('s, _menhir_box_modele) _menhir_cell1_UL_IDENT, _menhir_box_modele) _menhir_state
    (** State 22.
        Stack shape : UL_IDENT.
        Start symbol: modele. *)

  | MenhirState27 : (('s, _menhir_box_modele) _menhir_cell1_port, _menhir_box_modele) _menhir_state
    (** State 27.
        Stack shape : port.
        Start symbol: modele. *)

  | MenhirState30 : ((('s, _menhir_box_modele) _menhir_cell1_UL_SYSTEM _menhir_cell0_UL_IDENT_MAJ, _menhir_box_modele) _menhir_cell1_parametre, _menhir_box_modele) _menhir_state
    (** State 30.
        Stack shape : UL_SYSTEM UL_IDENT_MAJ parametre.
        Start symbol: modele. *)

  | MenhirState33 : (('s, _menhir_box_modele) _menhir_cell1_UL_FLOW _menhir_cell0_UL_IDENT, _menhir_box_modele) _menhir_state
    (** State 33.
        Stack shape : UL_FLOW UL_IDENT.
        Start symbol: modele. *)

  | MenhirState38 : ((('s, _menhir_box_modele) _menhir_cell1_UL_FLOW _menhir_cell0_UL_IDENT, _menhir_box_modele) _menhir_cell1_identOrnot _menhir_cell0_UL_IDENT, _menhir_box_modele) _menhir_state
    (** State 38.
        Stack shape : UL_FLOW UL_IDENT identOrnot UL_IDENT.
        Start symbol: modele. *)

  | MenhirState44 : (('s, _menhir_box_modele) _menhir_cell1_identOrnot _menhir_cell0_UL_IDENT, _menhir_box_modele) _menhir_state
    (** State 44.
        Stack shape : identOrnot UL_IDENT.
        Start symbol: modele. *)

  | MenhirState47 : (('s, _menhir_box_modele) _menhir_cell1_UL_BLOCK _menhir_cell0_UL_IDENT_MAJ, _menhir_box_modele) _menhir_state
    (** State 47.
        Stack shape : UL_BLOCK UL_IDENT_MAJ.
        Start symbol: modele. *)

  | MenhirState54 : (('s, _menhir_box_modele) _menhir_cell1_block_systeme_flot, _menhir_box_modele) _menhir_state
    (** State 54.
        Stack shape : block_systeme_flot.
        Start symbol: modele. *)


and ('s, 'r) _menhir_cell1_block_systeme_flot = 
  | MenhirCell1_block_systeme_flot of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_identOrnot = 
  | MenhirCell1_identOrnot of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_parametre = 
  | MenhirCell1_parametre of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_port = 
  | MenhirCell1_port of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_types = 
  | MenhirCell1_types of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_UL_BLOCK = 
  | MenhirCell1_UL_BLOCK of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UL_FLOW = 
  | MenhirCell1_UL_FLOW of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UL_IDENT = 
  | MenhirCell1_UL_IDENT of 's * ('s, 'r) _menhir_state * (
# 31 "Parser.mly"
       (string)
# 151 "Parser.ml"
)

and 's _menhir_cell0_UL_IDENT = 
  | MenhirCell0_UL_IDENT of 's * (
# 31 "Parser.mly"
       (string)
# 158 "Parser.ml"
)

and 's _menhir_cell0_UL_IDENT_MAJ = 
  | MenhirCell0_UL_IDENT_MAJ of 's * (
# 33 "Parser.mly"
       (string)
# 165 "Parser.ml"
)

and ('s, 'r) _menhir_cell1_UL_PARENTOUV = 
  | MenhirCell1_UL_PARENTOUV of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UL_SYSTEM = 
  | MenhirCell1_UL_SYSTEM of 's * ('s, 'r) _menhir_state

and _menhir_box_modele = 
  | MenhirBox_modele of (unit) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 55 "Parser.mly"
                                                       ( print_string "block : UL_BLOCK UL_IDENT_MAJ parametre UL_POINTVIRGUL\n" )
# 182 "Parser.ml"
     : (unit))

let _menhir_action_02 =
  fun () ->
    (
# 52 "Parser.mly"
                           ( print_string "block_systeme_flotsuite_Block_systeme_flot : block\n" )
# 190 "Parser.ml"
     : (unit))

let _menhir_action_03 =
  fun () ->
    (
# 53 "Parser.mly"
                              ( print_string "block_systeme_flotsuite_Block_systeme_flot : systeme\n" )
# 198 "Parser.ml"
     : (unit))

let _menhir_action_04 =
  fun () ->
    (
# 54 "Parser.mly"
                            ( print_string "block_systeme_flotsuite_Block_systeme_flot : flotsuite_Block_systeme_flot\n" )
# 206 "Parser.ml"
     : (unit))

let _menhir_action_05 =
  fun () ->
    (
# 77 "Parser.mly"
                                            ( print_string "entier_virg : UL_ENTIER UL_VIRGUL UL_ENTIER\n" )
# 214 "Parser.ml"
     : (unit))

let _menhir_action_06 =
  fun () ->
    (
# 78 "Parser.mly"
                        ( print_string "entier_virg : UL_ENTIER\n" )
# 222 "Parser.ml"
     : (unit))

let _menhir_action_07 =
  fun () ->
    (
# 80 "Parser.mly"
                                                                                      ( print_string "flot : UL_FLOW UL_IDENT UL_FROM identOrnot  UL_IDENT UL_TO suite_ident UL_POINTVIRGUL\n" )
# 230 "Parser.ml"
     : (unit))

let _menhir_action_08 =
  fun () ->
    (
# 82 "Parser.mly"
                                   ( print_string "identOrnot : UL_IDENT UL_POINT\n" )
# 238 "Parser.ml"
     : (unit))

let _menhir_action_09 =
  fun () ->
    (
# 83 "Parser.mly"
                        ( print_string "identOrnot : (* vide *)\n" )
# 246 "Parser.ml"
     : (unit))

let _menhir_action_10 =
  fun () ->
    (
# 88 "Parser.mly"
                                                                  ( print_string "identsuite_ident : identOrnot UL_IDENT UL_VIRGUL identsuite_ident\n" )
# 254 "Parser.ml"
     : (unit))

let _menhir_action_11 =
  fun () ->
    (
# 89 "Parser.mly"
                                       ( print_string "identsuite_ident : identOrnot UL_IDENT\n" )
# 262 "Parser.ml"
     : (unit))

let _menhir_action_12 =
  fun () ->
    (
# 47 "Parser.mly"
                                                                                   ( print_string "modele : UL_MODEL UL_IDENT UL_ACCOUV suite_Block_systeme_flotsuite_Block_systeme_flot UL_ACCFER UL_FIN\n" )
# 270 "Parser.ml"
     : (unit))

let _menhir_action_13 =
  fun () ->
    (
# 59 "Parser.mly"
                                               ( print_string "parametre : UL_PARENTOUV suite_parametre UL_PARENTFER\n" )
# 278 "Parser.ml"
     : (unit))

let _menhir_action_14 =
  fun () ->
    (
# 60 "Parser.mly"
                       ( print_string "parametre : (* vide *)\n" )
# 286 "Parser.ml"
     : (unit))

let _menhir_action_15 =
  fun () ->
    (
# 66 "Parser.mly"
                                         ( print_string "port : UL_IDENT UL_DEUXPOINT UL_IN type\n" )
# 294 "Parser.ml"
     : (unit))

let _menhir_action_16 =
  fun () ->
    (
# 67 "Parser.mly"
                                          ( print_string "port : UL_IDENT UL_DEUXPOINT  UL_OUT type\n" )
# 302 "Parser.ml"
     : (unit))

let _menhir_action_17 =
  fun () ->
    (
# 63 "Parser.mly"
                                   ( print_string "suitPort : port UL_VIRGUL port\n" )
# 310 "Parser.ml"
     : (unit))

let _menhir_action_18 =
  fun () ->
    (
# 64 "Parser.mly"
                ( print_string "suitPort : port\n" )
# 318 "Parser.ml"
     : (unit))

let _menhir_action_19 =
  fun () ->
    (
# 49 "Parser.mly"
                                                                        ( print_string "suite_Block_systeme_flot : block_systeme_flotsuite_Block_systeme_flot suite_Block_systeme_flot\n" )
# 326 "Parser.ml"
     : (unit))

let _menhir_action_20 =
  fun () ->
    (
# 50 "Parser.mly"
                                       ( print_string "suite_Block_systeme_flot : (* vide *)\n" )
# 334 "Parser.ml"
     : (unit))

let _menhir_action_21 =
  fun () ->
    (
# 74 "Parser.mly"
                                                   ( print_string "suite_entier : UL_CROCHOUV UL_ENTIER UL_CROCHFER\n" )
# 342 "Parser.ml"
     : (unit))

let _menhir_action_22 =
  fun () ->
    (
# 75 "Parser.mly"
                          ( print_string "suite_entier : (* vide *)\n" )
# 350 "Parser.ml"
     : (unit))

let _menhir_action_23 =
  fun () ->
    (
# 85 "Parser.mly"
                       ( print_string "suite_ident : (* vide *)\n" )
# 358 "Parser.ml"
     : (unit))

let _menhir_action_24 =
  fun () ->
    (
# 86 "Parser.mly"
                               ( print_string "suite_ident : Identsuite_ident\n" )
# 366 "Parser.ml"
     : (unit))

let _menhir_action_25 =
  fun () ->
    (
# 57 "Parser.mly"
                                                                                        ( print_string "systeme : UL_SYSTEM UL_IDENT_MAJ parametre UL_ACCOUV suite_Block_systeme_flotsuite_Block_systeme_flot UL_ACCFER\n" )
# 374 "Parser.ml"
     : (unit))

let _menhir_action_26 =
  fun () ->
    (
# 69 "Parser.mly"
                           ( print_string "type : types suite_entier\n" )
# 382 "Parser.ml"
     : (unit))

let _menhir_action_27 =
  fun () ->
    (
# 71 "Parser.mly"
               ( print_string "types : UL_INT\n" )
# 390 "Parser.ml"
     : (unit))

let _menhir_action_28 =
  fun () ->
    (
# 72 "Parser.mly"
                   ( print_string "types : UL_BOOLEAN\n" )
# 398 "Parser.ml"
     : (unit))

let _menhir_action_29 =
  fun () ->
    (
# 73 "Parser.mly"
                 ( print_string "types : float\n" )
# 406 "Parser.ml"
     : (unit))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | UL_ACCFER ->
        "UL_ACCFER"
    | UL_ACCOUV ->
        "UL_ACCOUV"
    | UL_BLOCK ->
        "UL_BLOCK"
    | UL_BOOLEAN ->
        "UL_BOOLEAN"
    | UL_CROCHFER ->
        "UL_CROCHFER"
    | UL_CROCHOUV ->
        "UL_CROCHOUV"
    | UL_DEUXPOINT ->
        "UL_DEUXPOINT"
    | UL_ENTIER _ ->
        "UL_ENTIER"
    | UL_FIN ->
        "UL_FIN"
    | UL_FLOAT ->
        "UL_FLOAT"
    | UL_FLOW ->
        "UL_FLOW"
    | UL_FROM ->
        "UL_FROM"
    | UL_IDENT _ ->
        "UL_IDENT"
    | UL_IDENT_MAJ _ ->
        "UL_IDENT_MAJ"
    | UL_IN ->
        "UL_IN"
    | UL_INT ->
        "UL_INT"
    | UL_MODEL ->
        "UL_MODEL"
    | UL_OUT ->
        "UL_OUT"
    | UL_PARENTFER ->
        "UL_PARENTFER"
    | UL_PARENTOUV ->
        "UL_PARENTOUV"
    | UL_POINT ->
        "UL_POINT"
    | UL_POINTVIRGUL ->
        "UL_POINTVIRGUL"
    | UL_SYSTEM ->
        "UL_SYSTEM"
    | UL_TO ->
        "UL_TO"
    | UL_VIRGUL ->
        "UL_VIRGUL"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_57 : type  ttv_stack. ttv_stack _menhir_cell0_UL_IDENT_MAJ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_FIN ->
          let MenhirCell0_UL_IDENT_MAJ (_menhir_stack, _) = _menhir_stack in
          let _v = _menhir_action_12 () in
          MenhirBox_modele _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_SYSTEM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT_MAJ _v ->
          let _menhir_stack = MenhirCell0_UL_IDENT_MAJ (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_PARENTOUV ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
          | UL_ACCOUV ->
              let _v_0 = _menhir_action_14 () in
              _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState05 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. (ttv_stack _menhir_cell0_UL_IDENT_MAJ as 'stack) -> _ -> _ -> ('stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_PARENTOUV (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState06 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT _v ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_IDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_DEUXPOINT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_OUT ->
              let _menhir_s = MenhirState09 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_INT ->
                  _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UL_FLOAT ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UL_BOOLEAN ->
                  _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | UL_IN ->
              let _menhir_s = MenhirState22 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_INT ->
                  _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UL_FLOAT ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UL_BOOLEAN ->
                  _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_27 () in
      _menhir_goto_types _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_types : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_types (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_CROCHOUV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_ENTIER _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_VIRGUL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | UL_ENTIER _ ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _ = _menhir_action_05 () in
                      _menhir_goto_entier_virg _menhir_stack _menhir_lexbuf _menhir_lexer _tok
                  | _ ->
                      _eRR ())
              | UL_CROCHFER ->
                  let _ = _menhir_action_06 () in
                  _menhir_goto_entier_virg _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | UL_PARENTFER | UL_VIRGUL ->
          let _ = _menhir_action_22 () in
          _menhir_goto_suite_entier _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_entier_virg : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_types -> _ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_CROCHFER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_21 () in
          _menhir_goto_suite_entier _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_suite_entier : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_types -> _ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_types (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_26 () in
      _menhir_goto_typee _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
  
  and _menhir_goto_typee : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      match _menhir_s with
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState09 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_23 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_IDENT -> _ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_UL_IDENT (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_15 () in
      _menhir_goto_port _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_port : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_VIRGUL ->
          let _menhir_stack = MenhirCell1_port (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState27 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_IDENT _v ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | UL_PARENTFER ->
          let _ = _menhir_action_18 () in
          _menhir_goto_suitPort _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_suitPort : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState27 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState06 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_28 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_port -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_port (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_17 () in
      _menhir_goto_suitPort _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_run_24 : type  ttv_stack. (ttv_stack _menhir_cell0_UL_IDENT_MAJ, _menhir_box_modele) _menhir_cell1_UL_PARENTOUV -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_UL_PARENTOUV (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_13 () in
      _menhir_goto_parametre _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_parametre : type  ttv_stack. (ttv_stack _menhir_cell0_UL_IDENT_MAJ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState47 ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState05 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_48 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_BLOCK _menhir_cell0_UL_IDENT_MAJ -> _ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_POINTVIRGUL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_UL_IDENT_MAJ (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_UL_BLOCK (_menhir_stack, _menhir_s) = _menhir_stack in
          let _ = _menhir_action_01 () in
          let _v = _menhir_action_02 () in
          _menhir_goto_block_systeme_flot _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_block_systeme_flot : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_block_systeme_flot (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_SYSTEM ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
      | UL_FLOW ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
      | UL_BLOCK ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
      | UL_ACCFER ->
          let _ = _menhir_action_20 () in
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_FLOW (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT _v ->
          let _menhir_stack = MenhirCell0_UL_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_FROM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_IDENT_MAJ _ ->
                  _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
              | UL_IDENT _ ->
                  let _v_1 = _menhir_action_09 () in
                  _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState33 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_34 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_POINT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_08 () in
          _menhir_goto_identOrnot _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_identOrnot : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState44 ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState38 ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState33 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_42 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_IDENT _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_VIRGUL ->
              let _menhir_stack = MenhirCell1_identOrnot (_menhir_stack, _menhir_s, _v) in
              let _menhir_stack = MenhirCell0_UL_IDENT (_menhir_stack, _v_0) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_IDENT_MAJ _ ->
                  _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
              | UL_IDENT _ ->
                  let _v_2 = _menhir_action_09 () in
                  _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState44 _tok
              | _ ->
                  _eRR ())
          | UL_POINTVIRGUL ->
              let _ = _menhir_action_11 () in
              _menhir_goto_identsuite_ident _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_identsuite_ident : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState44 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState38 ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_45 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_identOrnot _menhir_cell0_UL_IDENT -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell0_UL_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_identOrnot (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_10 () in
      _menhir_goto_identsuite_ident _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_run_41 : type  ttv_stack. ((ttv_stack, _menhir_box_modele) _menhir_cell1_UL_FLOW _menhir_cell0_UL_IDENT, _menhir_box_modele) _menhir_cell1_identOrnot _menhir_cell0_UL_IDENT -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _ = _menhir_action_24 () in
      _menhir_goto_suite_ident _menhir_stack _menhir_lexbuf _menhir_lexer
  
  and _menhir_goto_suite_ident : type  ttv_stack. ((ttv_stack, _menhir_box_modele) _menhir_cell1_UL_FLOW _menhir_cell0_UL_IDENT, _menhir_box_modele) _menhir_cell1_identOrnot _menhir_cell0_UL_IDENT -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_UL_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_identOrnot (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell0_UL_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_UL_FLOW (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_07 () in
      let _v = _menhir_action_04 () in
      _menhir_goto_block_systeme_flot _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_36 : type  ttv_stack. ((ttv_stack, _menhir_box_modele) _menhir_cell1_UL_FLOW _menhir_cell0_UL_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_identOrnot (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT _v_0 ->
          let _menhir_stack = MenhirCell0_UL_IDENT (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_TO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_IDENT_MAJ _ ->
                  _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
              | UL_IDENT _ ->
                  let _v_2 = _menhir_action_09 () in
                  _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState38 _tok
              | UL_POINTVIRGUL ->
                  let _ = _menhir_action_23 () in
                  _menhir_goto_suite_ident _menhir_stack _menhir_lexbuf _menhir_lexer
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_46 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_BLOCK (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT_MAJ _v ->
          let _menhir_stack = MenhirCell0_UL_IDENT_MAJ (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_PARENTOUV ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState47
          | UL_POINTVIRGUL ->
              let _ = _menhir_action_14 () in
              _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_55 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_block_systeme_flot -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_block_systeme_flot (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_19 () in
      _menhir_goto_suite_Block_systeme_flot _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_suite_Block_systeme_flot : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState03 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState54 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState30 ->
          _menhir_run_51 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_51 : type  ttv_stack. ((ttv_stack, _menhir_box_modele) _menhir_cell1_UL_SYSTEM _menhir_cell0_UL_IDENT_MAJ, _menhir_box_modele) _menhir_cell1_parametre -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_parametre (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell0_UL_IDENT_MAJ (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_UL_SYSTEM (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_25 () in
      let _v = _menhir_action_03 () in
      _menhir_goto_block_systeme_flot _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_29 : type  ttv_stack. ((ttv_stack, _menhir_box_modele) _menhir_cell1_UL_SYSTEM _menhir_cell0_UL_IDENT_MAJ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_modele) _menhir_state -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_parametre (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_ACCOUV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_SYSTEM ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | UL_FLOW ->
              _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | UL_BLOCK ->
              _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
          | UL_ACCFER ->
              let _ = _menhir_action_20 () in
              _menhir_run_51 _menhir_stack _menhir_lexbuf _menhir_lexer
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_21 : type  ttv_stack. (ttv_stack, _menhir_box_modele) _menhir_cell1_UL_IDENT -> _ -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_UL_IDENT (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_16 () in
      _menhir_goto_port _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_29 () in
      _menhir_goto_types _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_12 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_modele) _menhir_state -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_28 () in
      _menhir_goto_types _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_modele =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_MODEL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_IDENT_MAJ _v ->
              let _menhir_stack = MenhirCell0_UL_IDENT_MAJ (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_ACCOUV ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | UL_SYSTEM ->
                      _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
                  | UL_FLOW ->
                      _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
                  | UL_BLOCK ->
                      _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
                  | UL_ACCFER ->
                      let _ = _menhir_action_20 () in
                      _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let modele =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_modele v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 90 "Parser.mly"
  
# 960 "Parser.ml"
