open Util
open Mem

(* get_assoc: retourne la valeur
associée à la clef e
paramètres : cle e, liste d'associations, valeur par défaut
retour : valeur associée à e, ou def si e n'est pas dans la liste

 *)
let rec get_assoc e l def = match l with 
    | [] -> def
    | (a,b)::q -> if a=e then b else get_assoc e q def

let%test _ = get_assoc 1 [(1,2);(3,4)] 0 = 2
let%test _ = get_assoc 2 [(1,2);(3,4) ;(2,5)] 0 = 5
let%test _ = get_assoc 5 [(1,2);(3,4) ;(2,5)] 0 = 0





(* set_assoc : ajoute l'association (e,x) à la liste l si e n'y est pas déjà ou modifie l'association (e,_) par (e,x) si e est déjà dans l
paramètres : cle e, valeur x, liste d'associations
retour : liste d'associations avec l'association (e,x) ajoutée ou modifiée

 *)
let rec set_assoc e l x = match l with 
    | [] -> [(e,x)]
    | (a,b)::q -> if a=e then (e,x)::q else (a,b)::(set_assoc e q x)
    
    

let%test _ = set_assoc 1 [(1,2);(3,4)] 5 = [(1,5);(3,4)]
let%test _ = set_assoc 2 [(1,2);(3,4) ;(2,5)] 6 = [(1,2);(3,4) ;(2,6)]



module AssocMemory : Memory =
struct
    (* Type = liste qui associe des adresses (entiers) à des valeurs (caractères) *)
    type mem_type = (int * char) list

    (* Un type qui contient la mémoire + la taille de son bus d'adressage *)
    type mem = int * mem_type

    (* Nom de l'implémentation *)
    let name = "assoc"

    (* Taille du bus d'adressage *)
    let bussize (bs, _) = bs

    (* Taille maximale de la mémoire *)
    let size (bs, _) = pow2 bs

    (* Taille de la mémoire en mémoire *)
    let allocsize (bs, m) =  2* size( bs, m)

    (* Nombre de cases utilisées *)

    (* Nombre de cases utilisées *)

    (* Nombre de cases utilisées *)
    (* Nombre de cases utilisées *)
    let busyness (bs, m) = List.fold_left (fun acc (_, v) -> if v = _0 then acc else acc + 1) 0 m

    (* Construire une mémoire vide *)

    (* Construire une mémoire vide *)
    let clear bs = (bs, let rec aux n = if n = 0 then [] else (n - 1, _0) :: aux (n - 1) in aux (pow2 bs))

    

        
        


    (* Lire une valeur *)
    let read (bs, m) addr = if List.mem_assoc addr m then get_assoc addr m _0 else raise OutOfBound

    (* Écrire une valeur *)
    let write (bs, m) addr x = if List.mem_assoc addr m then (bs, set_assoc addr m x) else raise OutOfBound

    (* Afficher une mémoire *)
end
