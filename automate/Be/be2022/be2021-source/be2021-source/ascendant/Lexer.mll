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
let minuscule = ['a' - 'z']
let majuscule = ['A' - 'Z']
let alphabet = minuscule | majuscule
let iden = majuscule alphabet*
let name = minuscule alphabet*
let int = "0"|(non_zero chiffre*)
let alphanum = alphabet | chiffre | '_'
let commentaire =
  (* Commentaire fin de ligne *)
  "#" [^'\n']*
(*%token <string> UL_IDENT
%token <int> UL_INT
%token <string> UL_NAME

%token UL_ACO
%token UL_ACF
%token UL_AFF
%token UL_PV
%token UL_AFFECT
%token UL_PTVRG*)
rule lexer = parse
  | ['\n' '\t' ' ']+					{ (lexer lexbuf) }
  | commentaire						{ (lexer lexbuf) }
  (* A COMPLETER *)
  | eof							{ UL_FIN }
  | iden as texte					{ UL_IDENT (texte) }
  | name as texte					{ UL_NAME (texte) }
  | int as texte					{ UL_INT (int_of_string texte) }
  | "{"							{ UL_ACO }
  | "}"							{ UL_ACF }
  | "="							{ UL_AFF }
  | ";"							{ UL_PV }
  | _ as texte				 		{ (print_string "Erreur lexicale : ");(print_char texte);(print_newline ()); raise LexicalError }

{

}
