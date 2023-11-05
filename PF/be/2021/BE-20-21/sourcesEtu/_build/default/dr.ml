(*  Module qui permet la décomposition et la recomposition de données **)
(*  Passage du type t1 vers une liste d'éléments de type t2 (décompose) **)
(*  et inversement (recopose).**)
module type DecomposeRecompose =
sig
  (*  Type de la donnée **)
  type mot
  (*  Type des symboles de l'alphabet de t1 **)
  type symbole

  val decompose : mot -> symbole list
  val recompose : symbole list -> mot
end

module DRString : DecomposeRecompose with type mot = string and type symbole = char  = struct

  type mot = string

  type symbole = char 

  let rec decompose mot =
    match mot with
    | "" -> []
    | _ -> (String.get mot 0) :: (decompose (String.sub mot 1 ((String.length mot) - 1)))


  let  recompose list=List.fold_left (fun acc x -> acc^(Char.escaped x)) "" list

  let%test _ = decompose "abc" = ['a';'b';'c']
  let%test _ = decompose "a" = ['a']
  let%test _ = decompose "" = []
  let%test _ = recompose ['a';'b';'c'] = "abc"
  let%test _ = recompose ['a'] = "a"
  let%test _ = recompose [] = ""
end


module DRNat : DecomposeRecompose with type mot = int and type symbole = int = struct

  type mot = int

  type symbole = int

  let  rec decompose mot =
  if mot<9 then [mot]
  else (decompose (mot/10)) @ [mot mod 10]

  let  recompose list=List.fold_left (fun acc x -> acc*10+x) 0 list
    

    

  let%test _ = decompose 123 = [1;2;3]
  let%test _ = decompose 1 = [1]
  let%test _ = decompose 0 = [0]
  let%test _ = recompose [1;2;3] = 123
  let%test _ = recompose [1] = 1
  let%test _ = recompose [0] = 0
end

(*  Module qui permet de calculer la taille d'une donnée **)

