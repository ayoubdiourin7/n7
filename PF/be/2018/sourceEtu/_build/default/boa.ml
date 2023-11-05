
module type Regle =
sig

  type tid = int
  type td
  val id : tid
  
  val appliquer : td -> td list
end

module Regle1 : Regle = struct
  type tid = int
  type td = char list
  let id = 1
  let appliquer terme = match terme with
  |[] -> []
  |t::q -> if t='A' then ['O'::q] else [ terme]
end

module Regle2 : Regle = struct
  type tid = int
  type td = char list
  let id = 2
  let appliquer terme = match  terme with
  |[] -> []
  |t::q -> if t='B' then [ terme@q ]else [ terme]
end

module Regle3 : Regle = struct
  type tid = int
  type td = char list
  let id = 3
  let rec appliquer terme = match  terme with
  |[]->[]
  |t1::t2::t3::q -> if ((t1=='O')&&(t2=='O')&&(t3=='O')) || ((t1=='A')&&(t2=='O')&&(t3=='A')) 
                    then ['A'::q] @ List.map (fun x -> t1::x) (appliquer (t2::t3::q))
                    else List.map (fun x -> t1::x) (appliquer (t2::t3::q))
  |_ -> []
end

module Regle4 : Regle = struct
  type tid = int
  type td = char list
  let id = 4
  let rec appliquer terme = match  terme with
  |t1::t2::q -> if  ((t1=='A')&&(t2=='A')) 
                    then [q] @ List.map (fun x -> t1::x) (appliquer (t2::q))
                    else List.map (fun x -> t1::x) (appliquer (t2::q))
  |_ -> []
end





module type ArbreReecriture =
sig
  (*
  type tid = int
  type td
  type arbre_reecriture = ...

  val creer_noeud : ...

  val racine : ...
  val fils : ..

  val appartient : td -> arbre_reecriture -> bool
  *)
end