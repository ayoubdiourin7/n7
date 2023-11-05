{

(* Partie recopiée dans le fichier CaML généré. *)
(* Ouverture de modules exploités dans les actions *)
(* Déclarations de types, de constantes, de fonctions, d'exceptions exploités dans les actions *)

  open Parser 
  exception LexicalError

}

(* Déclaration d'expressions régulières exploitées par la suite *)
let chiffre = ['0' - '9']
let non_zero = ['1' - '9']
let int = non_zero chiffre*
let minuscule = ['a' - 'z']
let majuscule = ['A' - 'Z']

let alphabet = minuscule | majuscule
let ident = minuscule alphabet*
let ident_maj = majuscule alphabet*
let alphanum = alphabet | chiffre | '_'
let commentaire =
  (* Commentaire fin de ligne *)
  "#" [^'\n']*

rule lexer = parse
  | ['\n' '\t' ' ']+					{ (lexer lexbuf) }
  | commentaire						{ (lexer lexbuf) }
  | "{"							{ UL_ACCOUV }
  | "}"							{ UL_ACCFER }
  | "model"						{ UL_MODEL }
  | eof							{ UL_FIN }
  | "system"						{ UL_SYSTEM }
  | "block"						{ UL_BLOCK }
  | "flow"						{ UL_FLOW }
  | "from"						{ UL_FROM }
  | "to"							{ UL_TO }
  | "in"							{ UL_IN }
  | "out"						{ UL_OUT }
  | "int"						{ UL_INT }
  | "boolean"						{ UL_BOOLEAN }
  | "{"						{ UL_ACCOUV }
  | "}"						{ UL_ACCFER }
  | "["						{ UL_CROCHOUV }
  | "]"						{ UL_CROCHFER }
  | "("						{ UL_PARENTOUV }
  | ")"						{ UL_PARENTFER }
  | ","						{ UL_VIRGUL }
  | "."						{ UL_POINT }
  | ";"						{ UL_POINTVIRGUL }
  | ":"						{ UL_DEUXPOINT }
  |"float"				{ UL_FLOAT }
  | int as texte					{ UL_ENTIER (int_of_string texte) }
  | ident_maj as texte					{ UL_IDENT_MAJ texte }
  | ident as texte					{ UL_IDENT texte }
  |"EOF"				{ UL_FIN }
  | _ as texte				 		{ (print_string "Erreur lexicale : ");(print_char texte);(print_newline ()); raise LexicalError }

{

}
