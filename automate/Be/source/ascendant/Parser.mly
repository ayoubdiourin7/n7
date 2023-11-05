%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */

%token UL_PAROUV UL_PARFER
%token UL_PT UL_VIRG
%token UL_COUPURE 
%token UL_NEGATION
%token UL_FAIL
%token UL_DEDUCTION


/* Defini le type des donnees associees a l'unite lexicale */

%token <string> UL_SYMBOLE
%token <string> UL_VARIABLE

/* Unite lexicale particuliere qui represente la fin du fichier */

%token UL_FIN

/* Type renvoye pour le nom terminal document */
%type <unit> programme

/* Le non terminal document est l'axiome */
%start programme

%% /* Regles de productions */

programme : regle suite_regle UL_FIN { (print_endline "programme : regle suite_regle FIN ") }

regle : deduction { (print_endline "regle : deduction") }
        | axiome { (print_endline "regle : axiome") }

suite_regle : regle suite_regle { (print_endline "suite_regle : regle suite_regle") }
        | { (print_endline "suite_regle : Vide") }

deduction : predicat UL_DEDUCTION suite_predicat UL_PT { (print_endline "deduction : predicat DEDUCTION suite_predicat PT") }

suite_predicat : predicat_Fail_Coupure  { (print_endline "suite_predicat : predicat") }
               | predicat_Fail_Coupure UL_VIRG suite_predicat { (print_endline "suite_predicat : predicat VIRG suite_predicat") }
predicat_Fail_Coupure : moins_No predicat { (print_endline "predicat_Fail_Coupure : predicat") }
                       | UL_FAIL { (print_endline "predicat_Fail_Coupure : FAIL") }
                       | UL_COUPURE { (print_endline "predicat_Fail_Coupure : COUPURE") }
moins_No : UL_NEGATION { (print_endline "moins_No : NEGATION") }
         | { (print_endline "moins_No : Vide") }
predicat : UL_SYMBOLE  UL_PAROUV suite_variable_Terme UL_PARFER { (print_endline "predicat : SYMBOLE PAROUV suite_variable PARFER") }

suite_variable_Terme : variable_Terme { (print_endline "suite_variable_Terme : variable_Terme") }
                     | variable_Terme UL_VIRG suite_variable_Terme { (print_endline "suite_variable_Terme : variable_Terme VIRG suite_variable_Terme") }

variable_Terme : UL_VARIABLE { (print_endline "variable_Terme : VARIABLE") }
                | terme { (print_endline "variable_Terme : terme") }

terme : UL_SYMBOLE { (print_endline "terme : SYMBOLE") }
        |predicat { (print_endline "terme : predicat") }

axiome : predicat UL_PT { (print_endline "axiome : SYMBOLE PT") }
%%