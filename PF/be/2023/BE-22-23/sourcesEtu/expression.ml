(* Exercice 3 *)
module type Expression = sig
  (* Type pour représenter les expressions *)
  type exp


  (* eval : TO DO *)
  val eval : exp -> int
end


module ExpAvecArbreBiNoeud : Expression = struct

  type operateur = Moins | Plus | Fois | Div

  
  type arbre = 
    | Feuille of int
    | Noeud of operateur * arbre * arbre
  (* Type pour représenter les expressions *)
  type exp = arbre


  
  let rec eval  exp =
     match exp with
      | Feuille x -> x
      | Noeud (op, exp1, exp2) -> if op = Moins then (eval exp1) - (eval exp2)
                                  else if op = Plus then (eval exp1) + (eval exp2)
                                  else if op = Fois then (eval exp1) * (eval exp2)
                                  else if op = Div then (eval exp1) / (eval exp2)
                                  else failwith "Erreur"
  let%test _ = eval (Noeud (Plus, Feuille 1, Feuille 2)) = 3
  let%test _ = eval (Noeud (Moins, Noeud (Plus, Feuille 1, Feuille 2), Feuille 3)) = 0
end 

module ExpAvecArbreNoeud : Expression = struct 
  type op = Plus | Fois | Moins | Div

  type arbre = 
    | Feuille of int
    | Noeud of op * arbre list

  type exp = arbre

    
(* bienformee : exp -> bool *)
(* Vérifie qu'un arbre n-aire représente bien une expression n-aire *)
(* c'est-à-dire que les opérateurs d'addition et Foisiplication ont au moins deux opérandes *)
(* et que les opérateurs de division et soustraction ont exactement deux opérandes.*)
(* Paramètre : l'arbre n-aire dont ont veut vérifier si il correspond à une expression *)
let  rec bienformee arbre = match arbre with
  | Feuille _ -> true
  | Noeud (_, [x;y]) -> List.fold_left (fun acc a -> acc && bienformee a) true [x;y]
  | Noeud (op, x::y::z) -> if op = Div || op = Moins then false else List.fold_left (fun acc a -> acc && bienformee a) true (x::y::z)
  | _ -> false

let en1 = Noeud (Plus, [ Feuille 3; Feuille 4; Feuille 12 ])
let en2 = Noeud (Moins, [ en1; Feuille 5 ])
let en3 = Noeud (Fois, [ en1; en2; en1 ])
let en4 = Noeud (Div, [ en3; Feuille 2 ])
let en1err = Noeud (Plus, [ Feuille 3 ])
let en2err = Noeud (Moins, [ en1; Feuille 5; Feuille 4 ])
let en3err = Noeud (Fois, [ en1 ])
let en4err = Noeud (Div, [ en3; Feuille 2; Feuille 3 ])

let%test _ = bienformee en1
let%test _ = bienformee en2
let%test _ = bienformee en3
let%test _ = bienformee en4
let%test _ = not (bienformee en1err)
let%test _ = not (bienformee en2err)
let%test _ = not (bienformee en3err)
let%test _ = not (bienformee en4err)

(* eval : exp-> int *)
(* Calcule la valeur d'une expression n-aire *)
(* Paramètre : l'expression dont on veut calculer la valeur *)
(* Précondition : l'expression est bien formée *)
(* Résultat : la valeur de l'expression *)
let  rec eval_bienformee  expr = match expr with
  | Feuille x -> x
  | Noeud (op, [x;y]) ->  if op = Moins then (eval_bienformee x) - (eval_bienformee y)
                          else if op = Plus then (eval_bienformee x) + (eval_bienformee y)
                          else if op = Fois then (eval_bienformee x) * (eval_bienformee y)
                          else   (eval_bienformee x) / (eval_bienformee y)
  |Noeud(op , list) -> if op = Plus then List.fold_left (fun acc a -> acc + (eval_bienformee a)) 0 list
                      else   List.fold_left (fun acc a -> acc * (eval_bienformee a)) 1 list
                      


let%test _ = eval_bienformee en1 = 19
let%test _ = eval_bienformee en2 = 14
let%test _ = eval_bienformee en3 = 5054
let%test _ = eval_bienformee en4 = 2527

(*Définir l’exception Malformee*)

exception Malformee 

(* eval : exp-> int *)
(* Calcule la valeur d'une expression n-aire *)
(* Paramètre : l'expression dont on veut calculer la valeur *)
(* Résultat : la valeur de l'expression *)
(* Exception  Malformee si le paramètre est mal formé *)

let   eval expr = 
  if (bienformee expr ) then eval_bienformee expr
  else raise  (Malformee )



  let%test _ = eval en1 = 19
  let%test _ = eval en2 = 14
  let%test _ = eval en3 = 5054
  let%test _ = eval en4 = 2527
  
  let%test _ =
    try
      let _ = eval en1err in
      false
    with Malformee -> true
  
  let%test _ =
    try
      let _ = eval en2err in
      false
    with Malformee -> true
  
  let%test _ =
    try
      let _ = eval en3err in
      false
    with Malformee -> true
  
  let%test _ =
    try
      let _ = eval en4err in
      false
    with Malformee -> true
  



end
   
