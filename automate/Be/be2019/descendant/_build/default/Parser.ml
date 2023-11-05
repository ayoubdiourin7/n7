open Tokens

(* Type du résultat d'une analyse syntaxique *)
type parseResult =
  | Success of inputStream
  | Failure
;;
(*1. PR →R SR |symbole
2. SR →Λ |$
3. SR →R SR |symbole
4. R →P SP .| symbole
5. SP →Λ |.
6. SP →: −E SE |: −
7. E →fail |fail
8. E →! |!
9. E →-P |-
10. E →P |symbole
11. SE →Λ| .
12. SE →, E SE |,
13. P →symbole ( T ST ) |symbole
14. T →variable |variable
15. T →symbole O |symbole
16. ST →Λ |)
17. ST →, T ST |,
18. O →Λ| , .
19. O →( T ST )|( *)

(*let printToken t =
  (print_endline
     (match t with
      | UL_PAROUV -> "("
      | UL_PARFER -> ")"
      | UL_SYMBOLE  _ -> "SYMBOLE " ^ s
      | UL_VARIABLE (v) -> "VARIABLE " ^ v
      | UL_COUPURE -> "!"
      | UL_PT -> "."
      | UL_VIRG -> ","
      | UL_NEGATION -> "-"
      | UL_FIN -> "EOF"
      | UL_ECHEC -> "FAIL"
      | UL_DEDUCTION -> ":-"
));;*)

(* accept : token -> inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien le token attendu *)
(* et avance dans l'analyse si c'est le cas *)
let accept expected stream =
  match (peekAtFirstToken stream) with
    | token when (token = expected) ->
      (Success (advanceInStream stream))
    | _ -> Failure
;;
(* acceptIdent : inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien un identifiant *)
(* et avance dans l'analyse si c'est le cas *)
let acceptIdent stream =
  match (peekAtFirstToken stream) with
    | UL_SYMBOLE _ -> (Success (advanceInStream stream))
    | _ -> Failure
(* acceptUL_VARIABLE : inputStream -> parseResult *)
(* Vérifie que le premier token du flux d'entrée est bien une variable *)
(* et avance dans l'analyse si c'est le cas *)
let acceptUL_VARIABLE stream =
  match (peekAtFirstToken stream) with
    | UL_VARIABLE _ -> (Success (advanceInStream stream))
    | _ -> Failure
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


(* parseProgramme : inputStream -> parseResult *)
(* Analyse du non terminal Programme *)
let rec parseProgramme stream =
  (print_endline "Programme -> R SR\n");
  (match (peekAtFirstToken stream) with
    |UL_SYMBOLE _ -> inject stream >>= 
                  parseR  >>= 
                 parseSR
    | _ -> Failure
  )

and parseSR stream =
  (print_endline "R ->");
  (match (peekAtFirstToken stream) with
    |UL_SYMBOLE _ -> (print_endline "SR →R SR| symbole\n");inject stream >>= 
                  parseR  >>= 
                  parseSR 


    |UL_FIN -> (print_endline "SR →Λ $\n");inject stream
    | _ -> Failure
  )
and parseR stream =
  (print_endline "R ->");
  (match (peekAtFirstToken stream) with
    |UL_SYMBOLE _  -> (print_endline "R →P SP .| symbole\n"); inject stream >>= 
                  parseP  >>= 
                  parseSP >>=
                  accept UL_PT 
    | _ -> Failure
  )
and parseSP stream =
  (print_endline "SP ->");
  (match (peekAtFirstToken stream) with
    |UL_PT -> (print_endline "SP →Λ |.\n"); inject stream
    |UL_DEDUCTION -> (print_endline "SP →:- E SE |: −\n"); inject stream >>= 
                  accept UL_DEDUCTION >>= 
                  parseE  >>= 
                  parseSE
    | _ -> Failure
  )
and parseE stream =
  (print_endline "E ->");
  (match (peekAtFirstToken stream) with
    |UL_ECHEC -> (print_endline "E →fail |fail\n"); inject stream >>= 
                  accept UL_ECHEC
    |UL_COUPURE -> (print_endline "E →! |!\n");inject stream >>= 
                  accept UL_COUPURE
    |UL_NEGATION -> (print_endline "E →-P |-P\n");inject stream >>= 
                  accept UL_NEGATION >>= 
                  parseP
    |UL_SYMBOLE _ -> (print_endline "E →P |symbole\n");inject stream >>= 
                  parseP
    | _ -> Failure
  )
and parseSE stream =
  (print_endline "SE ->");
  (match (peekAtFirstToken stream) with
    |UL_PT -> (print_endline "SE →Λ| .\n");inject stream
    |UL_VIRG -> (print_endline "SE →, E SE |,\n");inject stream >>= 
                  accept UL_VIRG >>= 
                  parseE  >>= 
                  parseSE
    | _ -> Failure
  )
and parseP stream =
  (print_endline "P ->");
  (match (peekAtFirstToken stream) with
    |UL_SYMBOLE _ -> (print_endline "P →symbole ( T ST ) |symbole\n");inject stream >>= 
                  acceptIdent >>= 
                  accept UL_PAROUV >>= 
                  parseT  >>= 
                  parseST >>= 
                  accept UL_PARFER
    | _ -> Failure)
  
and parseT stream =
  (print_endline "T ->");
  (match (peekAtFirstToken stream) with
    |UL_VARIABLE _ -> (print_endline "T →variable |variable\n");inject stream >>= 
                      acceptUL_VARIABLE
    |UL_SYMBOLE _ -> (print_endline "T →symbole O |symbole\n");inject stream >>= 
                  acceptIdent >>=
                  parseO
    | _ -> Failure
  )
and parseST stream =
  (print_endline "ST ->");
  (match (peekAtFirstToken stream) with
    |UL_PARFER -> (print_endline "ST →Λ|)\n");inject stream
    |UL_VIRG -> (print_endline "ST →, T ST |,\n");inject stream >>= 
                  accept UL_VIRG >>= 
                  parseT  >>= 
                  parseST
    | _ -> Failure
  )
and parseO stream =
  (print_endline "O ->");
  (match (peekAtFirstToken stream) with
    | UL_PT  -> (print_endline "O →Λ| , .\n");inject stream
    | UL_VIRG -> (print_endline "O →Λ| , .\n");inject stream
    |UL_PAROUV -> (print_endline "O →( T ST )|( *\n");inject stream >>= 
                  accept UL_PAROUV >>= 
                  parseT  >>= 
                  parseST >>= 
                  accept UL_PARFER
    | UL_PARFER -> (print_endline "O →Λ| , .\n");inject stream
    | _ -> Failure
  )
;;
