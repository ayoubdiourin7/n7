open List
(*%token <string> UL_IDENT
%token <string> UL_NAME
%token <int> UL_INT
%token UL_ACO
%token UL_ACF
%token UL_AFF
%token UL_PV
*)

type token = 
    | UL_IDENT of string
    | UL_NAME of string
    | UL_INT of int
    | UL_ACO
    | UL_ACF
    | UL_AFF
    | UL_PV
    | UL_FIN
    | UL_ERREUR;;

type inputStream = token list;;



(* string_of_token : token -> string *)
(* Converti un token en une chaîne de caractère*)
let string_of_token token =
     match token with
       (* A COMPLETER *)
       | UL_FIN -> "EOF"
        | UL_IDENT s -> "UL_IDENT(" ^ s ^ ")"
        | UL_NAME s -> "UL_NAME(" ^ s ^ ")"
        | UL_INT i -> "UL_INT(" ^ string_of_int i ^ ")"
        | UL_ACO -> "UL_ACO"
        | UL_ACF -> "UL_ACF"
        | UL_AFF -> "UL_AFF"
        | UL_PV -> "UL_PV"
       | UL_ERREUR -> "Erreur Lexicale";;

(* string_of_stream : inputStream -> string *)
(* Converti un inputStream (liste de token) en une chaîne de caractère *)
let string_of_stream stream =
  List.fold_right (fun t tq -> (string_of_token t) ^ " " ^ tq ) stream "";;


(* peekAtFirstToken : inputStream -> token *)
(* Renvoie le premier élément d'un inputStream *)
(* Erreur : si l'inputStream est vide *)
let peekAtFirstToken stream = 
  match stream with
  (* Normalement, ne doit jamais se produire sauf si la grammaire essaie de lire *)
  (* après la fin de l'inputStream. *)
  | [] -> failwith "Impossible d'acceder au premier element d'un inputStream vide"
   |t::_ -> t;;




(* advanceInStream : inputStream -> inputStream *)
(* Consomme le premier élément d'un inputStream *)
(* Erreur : si l'inputStream est vide *)
let advanceInStream stream =
  match stream with
  (* Normalement, ne doit jamais se produire sauf si la grammaire essaie de lire *)
  (* après la fin de l'inputStream. *)
  | [] -> failwith "Impossible de consommer le premier element d'un inputStream vide"
  | _::q -> q;;


