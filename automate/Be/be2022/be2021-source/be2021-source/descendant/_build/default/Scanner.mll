{

(* Partie recopiée dans le fichier CaML généré. *)
(* Ouverture de modules exploités dans les actions *)
(* Déclarations de types, de constantes, de fonctions, d'exceptions exploités dans les actions *)

  open Tokens 
  exception Printf

}

(* Déclaration d'expressions régulières exploitées par la suite *)
let chiffre = ['0' - '9']
let minuscule = ['a' - 'z']
let majuscule = ['A' - 'Z']

let alphabet = minuscule | majuscule

let varible = majuscule alphabet*
let names = minuscule alphabet*
let entier = "0" | ['1' - '9'] ['0' - '9']*

(* Déclaration des règles de reconnaissance des lexèmes *)
let alphanum = alphabet | chiffre | '_'
let commentaire =
  (* Commentaire fin de ligne *)
  "#" [^'\n']*

  (*let string_of_token token =
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
       | UL_ERREUR -> "Erreur Lexicale";;*)

rule scanner = parse
  | ['\n' '\t' ' ']+					{ (scanner lexbuf) }
  | commentaire						{ (scanner lexbuf) }
  | varible as var					{ (UL_IDENT(var))::(scanner lexbuf) }

  | names as name					{ (UL_NAME(name))::(scanner lexbuf) }
  | entier as ent						{ (UL_INT(int_of_string(ent))) :: (scanner lexbuf) }
  | "{"							{ (UL_ACO)::(scanner lexbuf) }
  | "}"							{ (UL_ACF)::(scanner lexbuf) }
  | "="							{ (UL_AFF)::(scanner lexbuf) }
  | ";"							{ (UL_PV)::(scanner lexbuf) }
  | eof							{ [UL_FIN]}
  | _ as texte				 		{ (print_string "Erreur lexicale : ");(print_char texte);(print_newline ()); (UL_ERREUR::(scanner lexbuf)) }

{

}
