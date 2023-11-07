%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */

(* les terminaux sont les identificateurs de champs et de variables, les entiers, les accolades
ouvrante { et fermante }, l’affectation = et le point virgule ; ;*)

%token <string> UL_IDENT
%token <string> UL_NAME
%token <int> UL_INT
%token UL_ACO
%token UL_ACF
%token UL_AFF
%token UL_PV

/* Defini le type des donnees associees a l'unite lexicale */

(* A COMPLETER *)

/* Unite lexicale particuliere qui represente la fin du fichier */

%token UL_FIN

/* Type renvoye pour le nom terminal document */
%type <unit> record

/* Le non terminal document est l'axiome */
%start record

%% /* Regles de productions */

record : valeur UL_FIN { (print_endline "record : valeur UL_FIN") }

valeur : UL_ACO UL_ACF { (print_endline "valeur : UL_ACO UL_ACF") }
        | UL_ACO champ UL_ACF { (print_endline "valeur : UL_ACO champ UL_ACF") }
       | UL_IDENT{ (print_endline "valeur : UL_IDENT") }
         | UL_INT{ (print_endline "valeur : UL_INT") }

champ : UL_NAME UL_AFF valeur { (print_endline "champ : UL_NAME UL_AFF valeur") }
      | UL_NAME UL_AFF valeur UL_PV champ { (print_endline "champ : UL_NAME UL_AFF valeur UL_PV champ") }

%%
