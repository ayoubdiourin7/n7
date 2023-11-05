(* Exercice 1*)

(* max : int list -> int  *)
(* Paramètre : liste dont on cherche le maximum *)
(* Précondition : la liste n'est pas vide *)
(* Résultat :  l'élément le plus grand de la liste *)
let max  list = List.fold_left(fun acc e -> if acc < e then e else acc) 0 list

(************ tests de max ************)
let%test _ = max [ 1 ] = 1
let%test _ = max [ 1; 2 ] = 2
let%test _ = max [ 2; 1 ] = 2
let%test _ = max [ 1; 2; 3; 4; 3; 2; 1 ] = 4

(* TO DO : copier / coller les tests depuis conwayTests.txt *)

(* max_max : int list list -> int  *)
(* Paramètre : la liste de listes dont on cherche le maximum *)
(* Précondition : il y a au moins un élement dans une des listes *)
(* Résultat :  l'élément le plus grand de la liste *)
let max_max list = max (List.flatten list)

let%test _ = max_max [ [ 1 ] ] = 1
let%test _ = max_max [ [ 1 ]; [ 2 ] ] = 2
let%test _ = max_max [ [ 2 ]; [ 2 ]; [ 1; 1; 2; 1; 2 ] ] = 2
let%test _ = max_max [ [ 2 ]; [ 1 ] ] = 2
let%test _ = max_max [ [ 1; 1; 2; 1 ]; [ 1; 2; 2 ] ] = 2

(* TO DO : copier / coller les tests depuis conwayTests.txt *)


(* Exercice 2*)

(* suivant : int list -> int list *)
(* Calcule le terme suivant dans une suite de Conway *)
(* Paramètre : le terme dont on cherche le suivant *)
(* Précondition : paramètre différent de la liste vide *)
(* Retour : le terme suivant *)

let suivant list = 
  let rec aux last acc  occ rest = match rest with
    | [] -> List.rev (last:: occ:: acc)
    | h::t -> if h = last then aux last acc (occ+1) t else aux  h (last::occ::acc)  1  t
in  aux (List.hd list) [] 1 (List.tl list)

  let%test _ = suivant [ 1 ] = [ 1; 1 ]
  let%test _ = suivant [ 2 ] = [ 1; 2 ]
  let%test _ = suivant [ 3 ] = [ 1; 3 ]
  let%test _ = suivant [ 1; 1 ] = [ 2; 1 ]
  let%test _ = suivant [ 1; 2 ] = [ 1; 1; 1; 2 ]
  let%test _ = suivant [ 1; 1; 1; 1; 3; 3; 4 ] = [ 4; 1; 2; 3; 1; 4 ]
  let%test _ = suivant [ 1; 1; 1; 3; 3; 4 ] = [ 3; 1; 2; 3; 1; 4 ]
  let%test _ = suivant [ 1; 3; 3; 4 ] = [ 1; 1; 2; 3; 1; 4 ]
  let%test _ = suivant [3;3] = [2;3]


(* TO DO : copier / coller les tests depuis conwayTests.txt *)

(* suite : int -> int list -> int list list *)
(* Calcule la suite de Conway *)
(* Paramètre taille : le nombre de termes de la suite que l'on veut calculer *)
(* Paramètre depart : le terme de départ de la suite de Conway *)
(* Résultat : la suite de Conway *)
let rec suite  n premier =
 match n with
  | 1 -> [premier]
  | _ -> premier::(suite (n-1) (suivant premier))


  let%test _ = suite 1 [ 1 ] = [ [ 1 ] ]
  let%test _ = suite 2 [ 1 ] = [ [ 1 ]; [ 1; 1 ] ]
  let%test _ = suite 3 [ 1 ] = [ [ 1 ]; [ 1; 1 ]; [ 2; 1 ] ]
  let%test _ = suite 4 [ 1 ] = [ [ 1 ]; [ 1; 1 ]; [ 2; 1 ]; [ 1; 2; 1; 1 ] ]
  
  let%test _ =
    suite 5 [ 1 ]
    = [ [ 1 ]; [ 1; 1 ]; [ 2; 1 ]; [ 1; 2; 1; 1 ]; [ 1; 1; 1; 2; 2; 1 ] ]
  

    let%test _ =
    suite 5 [ 1 ]
    = [ [ 1 ]; [ 1; 1 ]; [ 2; 1 ]; [ 1; 2; 1; 1 ]; [ 1; 1; 1; 2; 2; 1 ] ]
  
  let%test _ =
    suite 10 [ 1 ]
    = [
        [ 1 ];
        [ 1; 1 ];
        [ 2; 1 ];
        [ 1; 2; 1; 1 ];
        [ 1; 1; 1; 2; 2; 1 ];
        [ 3; 1; 2; 2; 1; 1 ];
        [ 1; 3; 1; 1; 2; 2; 2; 1 ];
        [ 1; 1; 1; 3; 2; 1; 3; 2; 1; 1 ];
        [ 3; 1; 1; 3; 1; 2; 1; 1; 1; 3; 1; 2; 2; 1 ];
        [ 1; 3; 2; 1; 1; 3; 1; 1; 1; 2; 3; 1; 1; 3; 1; 1; 2; 2; 1; 1 ];
      ]
  
  let%test _ =
    suite 10 [ 3; 3 ]
    = [
        [ 3; 3 ];
        [ 2; 3 ];
        [ 1; 2; 1; 3 ];
        [ 1; 1; 1; 2; 1; 1; 1; 3 ];
        [ 3; 1; 1; 2; 3; 1; 1; 3 ];
        [ 1; 3; 2; 1; 1; 2; 1; 3; 2; 1; 1; 3 ];
        [ 1; 1; 1; 3; 1; 2; 2; 1; 1; 2; 1; 1; 1; 3; 1; 2; 2; 1; 1; 3 ];
        [ 3; 1; 1; 3; 1; 1; 2; 2; 2; 1; 1; 2; 3; 1; 1; 3; 1; 1; 2; 2; 2; 1; 1; 3 ];
        [ 1; 3; 2; 1; 1; 3; 2; 1; 3; 2; 2; 1; 1; 2; 1; 3; 2; 1; 1; 3; 2; 1; 3; 2; 2; 1; 1; 3; ];
        [ 1; 1; 1; 3; 1; 2; 2; 1; 1; 3; 1; 2; 1; 1; 1; 3; 2; 2; 2; 1; 1; 2; 1; 1; 1; 3; 1; 2; 2; 1; 1; 3; 1; 2; 1; 1; 1; 3; 2; 2; 2; 1; 1; 3; ];
      ]

(* TO DO : copier / coller les tests depuis conwayTests.txt *)

(* Tests de la conjecture *)
(* "Aucun terme de la suite, démarant à 1, ne comporte un chiffre supérieur à 3" *)
(* TO DO *)
(* Remarque : TO DO *)