open Parser

(* Fonction d'affichage des unités lexicales et des données qu'elles contiennent *)
(*rule lexer = parse
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
*)
let printToken t =
  (print_endline
   (match t with
    | UL_IDENT (texte) -> "UL_IDENT " ^ texte
    | UL_NAME (texte) -> "UL_NAME " ^ texte
    | UL_INT (texte) -> "UL_INT " ^ (string_of_int texte)
    | UL_ACO -> "{"
    | UL_ACF -> "}"
    | UL_AFF -> "="
    | UL_PV -> ";"
  

       | UL_FIN -> "EOF"
));;

(* Analyse lexicale, syntaxique et sémantique du fichier passé en paramètre de la ligne de commande *)

let main () =
if (Array.length Sys.argv > 1)
then
  ((let lexbuf = (Lexing.from_channel (open_in Sys.argv.(1))) in
  try
    (let token = ref (Lexer.lexer lexbuf) in
    while ((!token) != UL_FIN) do
      (printToken (!token));
      (token := (Lexer.lexer lexbuf))
    done)
  with
  | Lexer.LexicalError ->
    (print_endline "KO"));
  (let lexbuf = (Lexing.from_channel (open_in Sys.argv.(1))) in
  try
    (Parser.record Lexer.lexer lexbuf);(print_endline "OK")
  with
  | Lexer.LexicalError ->
    print_endline "KO"
  | Parser.Error ->
     (print_endline "KO"))
  )
else
  (print_endline "MainScheme fichier");;

main();;
