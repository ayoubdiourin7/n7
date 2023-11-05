%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */
%token UL_MODEL
%token UL_SYSTEM
%token UL_BLOCK
%token UL_FLOW
%token UL_FROM
%token UL_TO
%token UL_IN
%token UL_OUT
%token UL_INT
%token UL_BOOLEAN
%token UL_ACCOUV UL_ACCFER
%token UL_CROCHOUV UL_CROCHFER  
%token UL_PARENTOUV UL_PARENTFER
%token UL_VIRGUL
%token UL_POINT
%token UL_POINTVIRGUL
%token UL_DEUXPOINT
%token UL_FLOAT

/* Defini le type des donnees associees a l'unite lexicale */

%token <string> UL_IDENT
%token <int> UL_ENTIER
%token <string> UL_IDENT_MAJ

/* Unite lexicale particuliere qui represente la fin du fichier */

%token UL_FIN

/* Type renvoye pour le nom terminal document */
%type <unit> modele

/* Le non terminal document est l'axiome */
%start modele

%% /* Regles de productions */

modele : UL_MODEL UL_IDENT_MAJ UL_ACCOUV suite_Block_systeme_flot UL_ACCFER UL_FIN { print_string "modele : UL_MODEL UL_IDENT UL_ACCOUV suite_Block_systeme_flotsuite_Block_systeme_flot UL_ACCFER UL_FIN\n" }
;    
suite_Block_systeme_flot : block_systeme_flot suite_Block_systeme_flot  { print_string "suite_Block_systeme_flot : block_systeme_flotsuite_Block_systeme_flot suite_Block_systeme_flot\n" }
                          | (* vide *) { print_string "suite_Block_systeme_flot : (* vide *)\n" }

block_systeme_flot : block { print_string "block_systeme_flotsuite_Block_systeme_flot : block\n" }
                    | systeme { print_string "block_systeme_flotsuite_Block_systeme_flot : systeme\n" }
                    | flot  { print_string "block_systeme_flotsuite_Block_systeme_flot : flotsuite_Block_systeme_flot\n" }
block : UL_BLOCK UL_IDENT_MAJ parametre UL_POINTVIRGUL { print_string "block : UL_BLOCK UL_IDENT_MAJ parametre UL_POINTVIRGUL\n" }

systeme : UL_SYSTEM UL_IDENT_MAJ parametre UL_ACCOUV suite_Block_systeme_flot UL_ACCFER { print_string "systeme : UL_SYSTEM UL_IDENT_MAJ parametre UL_ACCOUV suite_Block_systeme_flotsuite_Block_systeme_flot UL_ACCFER\n" }

parametre : UL_PARENTOUV suitPort UL_PARENTFER { print_string "parametre : UL_PARENTOUV suite_parametre UL_PARENTFER\n" }
          | (* vide *) { print_string "parametre : (* vide *)\n" }

 
suitPort : port UL_VIRGUL suitPort { print_string "suitPort : port UL_VIRGUL port\n" }
         | port { print_string "suitPort : port\n" }
    
port : UL_IDENT UL_DEUXPOINT UL_IN typee { print_string "port : UL_IDENT UL_DEUXPOINT UL_IN type\n" }
     | UL_IDENT UL_DEUXPOINT UL_OUT typee { print_string "port : UL_IDENT UL_DEUXPOINT  UL_OUT type\n" }

typee : types suite_entier { print_string "type : types suite_entier\n" }

types : UL_INT { print_string "types : UL_INT\n" }
      | UL_BOOLEAN { print_string "types : UL_BOOLEAN\n" }
      | UL_FLOAT { print_string "types : float\n" }
suite_entier : UL_CROCHOUV entier_virg UL_CROCHFER { print_string "suite_entier : UL_CROCHOUV UL_ENTIER UL_CROCHFER\n" }
             | (* vide *) { print_string "suite_entier : (* vide *)\n" }
            
entier_virg : UL_ENTIER UL_VIRGUL UL_ENTIER { print_string "entier_virg : UL_ENTIER UL_VIRGUL UL_ENTIER\n" }
            | UL_ENTIER { print_string "entier_virg : UL_ENTIER\n" }

flot : UL_FLOW UL_IDENT UL_FROM identOrnot  UL_IDENT UL_TO suite_ident UL_POINTVIRGUL { print_string "flot : UL_FLOW UL_IDENT UL_FROM identOrnot  UL_IDENT UL_TO suite_ident UL_POINTVIRGUL\n" }

identOrnot : UL_IDENT_MAJ UL_POINT { print_string "identOrnot : UL_IDENT UL_POINT\n" }
           | (* vide *) { print_string "identOrnot : (* vide *)\n" }

suite_ident : (*vide*) { print_string "suite_ident : (* vide *)\n" }
            | identsuite_ident { print_string "suite_ident : Identsuite_ident\n" }
    
identsuite_ident : identOrnot UL_IDENT UL_VIRGUL identsuite_ident { print_string "identsuite_ident : identOrnot UL_IDENT UL_VIRGUL identsuite_ident\n" }
                 | identOrnot UL_IDENT { print_string "identsuite_ident : identOrnot UL_IDENT\n" }
%%