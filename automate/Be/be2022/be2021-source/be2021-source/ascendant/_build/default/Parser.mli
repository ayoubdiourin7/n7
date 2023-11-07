
(* The type of tokens. *)

type token = 
  | UL_PV
  | UL_NAME of (string)
  | UL_INT of (int)
  | UL_IDENT of (string)
  | UL_FIN
  | UL_AFF
  | UL_ACO
  | UL_ACF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val record: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit)
