%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

(* let nbrVariables = ref 0;; *)

let nbrFonctions = ref 0;;

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */

%token IMPORT
%token <string> IDENT TYPEIDENT
%token INT FLOAT BOOL CHAR VOID STRING
%token ACCOUV ACCFER PAROUV PARFER CROOUV CROFER
%token PTVIRG VIRG
%token SI SINON TANTQUE RETOUR
/* Defini le type des donnees associees a l'unite lexicale */
%token <int> ENTIER
%token <float> FLOTTANT
%token <bool> BOOLEEN
%token <char> CARACTERE
%token <string> CHAINE
%token VIDE
%token NOUVEAU
%token ASSIGN
%token OPINF OPSUP OPINFEG OPSUPEG OPEG OPNONEG
%token OPPLUS OPMOINS OPOU
%token OPMULT OPMOD OPDIV OPET
%token OPNON
%token OPPT
/* Unite lexicale particuliere qui represente la fin du fichier */
%token FIN

/* Declarations des regles d'associative et de priorite pour les operateurs */
/* La priorite est croissante de haut en bas */
/* Associatif a droite */
%right ASSIGN /* Priorite la plus faible */
/* Non associatif */
%nonassoc OPINF OPSUP OPINFEG OPSUPEG OPEG OPNONEG
/* Associatif a gauche */
%left OPPLUS OPMOINS OPOU
%left OPMULT OPMOD OPDIV OPET
%right OPNON
%left OPPT PAROUV CROOUV /* Priorite la plus forte */

/* Type renvoye pour le nom terminal fichier */
%type <unit> fichier
%type <int> variables

/* Le non terminal fichier est l'axiome */
%start fichier

%% /* Regles de productions */

fichier : programme FIN { (print_endline "fichier : programme FIN");(print_string "Nombre de fonctions : ");(print_int !nbrFonctions);(print_newline()) }

programme : /* Lambda, mot vide */ { (nbrFonctions := 0); (print_endline "programme : /* Lambda, mot vide */") }
          | fonction programme { (nbrFonctions := !nbrFonctions + 1);(print_endline "programme : fonction programme") }

typeStruct : typeBase declTab { (print_endline "typeStruct : typeBase declTab") }

typeBase : INT { (print_endline "typeBase : INT") }
         | FLOAT { (print_endline "typeBase : FLOAT") }
         | BOOL { (print_endline "typeBase : BOOL") }
         | CHAR { (print_endline "typeBase : CHAR") }
         | STRING { (print_endline "typeBase : STRING") }
         | TYPEIDENT { (print_endline "typeBase : TYPEIDENT") }

declTab : /* Lambda, mot vide */ { (print_endline "declTab : /* Lambda, mot vide */") }
        | CROOUV CROFER { (print_endline "declTab : CROOUV CROFER") }

fonction : entete bloc  { (print_endline "fonction : entete bloc") }

entete : typeStruct IDENT PAROUV parsFormels PARFER { (print_endline "entete : typeStruct IDENT PAROUV parsFormels PARFER") }
       | VOID IDENT PAROUV parsFormels PARFER { (print_endline "entete : VOID IDENT PAROUV parsFormels PARFER") }

parsFormels : /* Lambda, mot vide */ { (print_endline "parsFormels : /* Lambda, mot vide */") }
            | typeStruct IDENT suiteParsFormels { (print_endline "parsFormels : typeStruct IDENT suiteParsFormels") }

suiteParsFormels : /* Lambda, mot vide */ { (print_endline "suiteParsFormels : /* Lambda, mot vide */") }
                 | VIRG typeStruct IDENT suiteParsFormels { (print_endline "suiteParsFormels : VIRG typeStruct IDENT suiteParsFormels") }

bloc : ACCOUV /* $1 */ variables /* $2 */ instructions /* $3 */ ACCFER /* $4 */
     {
	(print_endline "bloc : ACCOUV variables instructions ACCFER");
	(print_string "Nombre de variables = ");
	(print_int $2);
	(print_newline ())
	}

variables : /* Lambda, mot vide */
	  {
		(print_endline "variables : /* Lambda, mot vide */");
		0
		}
          | variable /* $1 */ variables /* $2 */
	  {
		(print_endline "variables : variable variables");
		($2 + 1)
		}

variable : typeStruct IDENT PTVIRG { (print_endline "variable : typeStruct IDENT PTVIRG") }

/* A FAIRE : Completer pour decrire une liste d'instructions eventuellement vide */
instructions : instruction instructions { (print_endline "instructions : instruction instructions") }
			 /* lambda */
			 | { (print_endline "instructions : /* Lambda, mot vide */") }


/* A FAIRE : Completer pour ajouter les autres formes d'instructions */
               instruction : expression PTVIRG { (print_endline "instruction : expression PTVIRG") }
                             | RETOUR expression PTVIRG  { (print_endline "instruction : RETURN expression PTVIRG") }
							 | SI PAROUV expression PARFER bloc sinonBloc { (print_endline "instruction : SI PAROUV expression PARFER bloc sinonBloc") }
							 | TANTQUE PAROUV expression PARFER bloc { (print_endline "instruction : TANTQUE PAROUV expression PARFER bloc") }


sinonBloc : /* Lambda, mot vide */ { (print_endline "sinonBloc : /* Lambda, mot vide */") }
		  | SINON bloc { (print_endline "sinonBloc : SINON bloc") }

/* A FAIRE : Completer pour ajouter les autres formes d'expressions */
expression :  unairesuite expressionsuite { (print_endline "expression : expressionsuite") }
			 | binairesuite { (print_endline "expression : binairesuite") }

unairesuite : /* Lambda, mot vide */ { (print_endline "unairesuite : /* Lambda, mot vide */") }
			|unaire unairesuite { (print_endline "unairesuite : unaire unairesuite") }	
unaire : OPPLUS { (print_endline "unaire : OPPLUS") }
	   | OPMOINS { (print_endline "unaire : OPMOINS") }
	   | OPNON { (print_endline "unaire : OPNON") }
	   |PAROUV typeStruct PARFER { (print_endline "unaire : PAROUV typeStruct PARFER") }

expressionsuite : ENTIER { (print_endline "expressionsuite : ENTIER") }
				| FLOTTANT { (print_endline "expressionsuite : FLOTTANT") }
				| BOOLEEN { (print_endline "expressionsuite : BOOLEEN") }
				| CARACTERE { (print_endline "expressionsuite : CARACTERE") }
				|VIDE { (print_endline "expressionsuite : VIDE") }
				| newident { (print_endline "expressionsuite : newident") }
				| idensuffixe { (print_endline "expressionsuite : idensuffixe") }

newident : NOUVEAU IDENT  expressionouparouvcroouv { (print_endline "newident : NOUVEAU TYPEIDENT  expressionouparouvcroouv") }

expressionouparouvcroouv : PAROUV PARFER { (print_endline "expressionouparouvcroouv : PAROUV PARFER") }
						 | CROOUV expression CROFER { (print_endline "expressionouparouvcroouv : CROOUV expression CROFER") }

idensuffixe : IDENT  suffixeOrnothings { (print_endline "idensuffixe : IDENT  suffixeornothings") }
			|PAROUV expression PARFER suffixeOrnothings { (print_endline "idensuffixe : PAROUV expression PARFER suffixeornothings") }

suffixeOrnothings : /* Lambda, mot vide */ { (print_endline "suffixeornothings : /* Lambda, mot vide */") }
				  | suffixe  suffixeOrnothings { (print_endline "suffixeornothings : suffixe  suffixeornothings") }

suffixe : POINT IDENT { (print_endline "suffixe : POINT IDENT") }
		| CROOUV expression CROFER { (print_endline "suffixe : CROOUV expression CROFER") }
		| PAROUV suiteExpressions PARFER { (print_endline "suffixe : PAROUV suiteExpressions PARFER") }

%%
