open Tokens

(* Type du résultat d'une analyse syntaxique *)
type parseResult =
  | Success of inputStream
  | Failure
;;

(* accept : token -> inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien le token attendu *)
(* et avance dans l'analyse si c'est le cas *)
let accept expected stream =
  match (peekAtFirstToken stream) with
    | token when (token = expected) ->
      (Success (advanceInStream stream))
    | _ -> Failure
;;
let acceptUL_IDENT  stream =  match (peekAtFirstToken stream) with | UL_IDENT _  -> (Success (advanceInStream stream)) | _ -> Failure;;
let acceptUL_INT  stream =  match (peekAtFirstToken stream) with | UL_INT _  -> (Success (advanceInStream stream)) | _ -> Failure;;

let acceptUL_NAME  stream =  match (peekAtFirstToken stream) with | UL_NAME _  -> (Success (advanceInStream stream)) | _ -> Failure;;

(* peekAtFirstToken : inputStream -> token *)
(* Renvoie le premier token du flux d'entrée *)
(* Définition de la monade  qui est composée de : *)
(* - le type de donnée monadique : parseResult  *)
(* - la fonction : inject qui construit ce type à partir d'une liste de terminaux *)
(* - la fonction : bind (opérateur >>=) qui combine les fonctions d'analyse. *)

(* inject inputStream -> parseResult *)
(* Construit le type de la monade à partir d'une liste de terminaux *)
let inject s = Success s;;

(* bind : 'a m -> ('a -> 'b m) -> 'b m *)
(* bind (opérateur >>=) qui combine les fonctions d'analyse. *)
(* ici on utilise une version spécialisée de bind :
   'b  ->  inputStream
   'a  ->  inputStream
    m  ->  parseResult
*)
(* >>= : parseResult -> (inputStream -> parseResult) -> parseResult *)
let (>>=) result f =
  match result with
    | Success next -> f next
    | Failure -> Failure
;;

(*V → { X } {
2. V → Ident Ident
3. V → entier entier
4. X → Λ }
5. X → F SF N ame
6. F → N ame = V N ame
7. SF → ; F SF ;
8. SF → Λ }*)

(* parseV : inputStream -> parseResult *)
(* Analyse du non terminal Programme *)
let rec parseV stream =
  (print_string "V -> ");
  (match (peekAtFirstToken stream) with
    | UL_ACO ->
      (print_string "{ "); inject stream >>=
      (accept UL_ACO ) >>= parsX >>= accept UL_ACF 
    | UL_IDENT _ ->
      (print_string "Ident Ident"); inject stream >>=
      acceptUL_IDENT
    | UL_INT _ -> 
      (print_string "entier entier"); inject stream >>=
      acceptUL_INT
    | _ -> Failure )

and parsX stream =
  (print_string "X -> ");
  (match (peekAtFirstToken stream) with
    | UL_ACF -> 
      (print_string "Λ"); inject stream
    | UL_NAME _ ->
      (print_string "F SF "); inject stream >>=
      parsF >>= parsSF 
    | _ -> Failure )
and parsF stream =
  (print_string "F -> ");
  (match (peekAtFirstToken stream) with
    | UL_NAME _ ->
      (print_string "N ame = V "); inject stream >>=
      acceptUL_NAME >>= accept UL_AFF >>= parseV 
    | _ -> Failure )


and parsSF stream =
  (print_string "SF -> ");
  (match (peekAtFirstToken stream) with
    | UL_PV ->
      (print_string "; F SF ;"); inject stream >>=
      accept UL_PV >>= parsF >>= parsSF 
    | UL_ACF ->
      (print_string "Λ"); inject stream
    | _ -> Failure )
;;
