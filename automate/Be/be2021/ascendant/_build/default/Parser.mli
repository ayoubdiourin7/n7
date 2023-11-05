
(* The type of tokens. *)

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
  | UL_IDENT_MAJ of (string)
  | UL_IDENT of (string)
  | UL_FROM
  | UL_FLOW
  | UL_FLOAT
  | UL_FIN
  | UL_ENTIER of (int)
  | UL_DEUXPOINT
  | UL_CROCHOUV
  | UL_CROCHFER
  | UL_BOOLEAN
  | UL_BLOCK
  | UL_ACCOUV
  | UL_ACCFER

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val modele: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit)
