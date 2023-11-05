
(*
  pgcd : int -> int -> int
  pgcd a b calcule le pgcd de a et b
  Précondition : ((a >= 0) && (b >= 0) && (a=!0 || b!=0)
  paramètre a : int ; le premier entier
  Resultat : int ; le plus grand diviseur commun de a et b
*)
let rec pgcd (a b) = 
  if a=b then a
  else if a>b then pgcd (a-b) b
  else pgcd a (b-a)

let%test _ = pgcd(3,5)=1
let%test _ = pgcd(6,3)=3
let%test _ = pgcd(3,6)=3
let%test _ = pgcd(6,6)=6
let%test _ = pgcd(0,6)=6
let%test _ = pgcd(6,0)=6
let%test _ = pgcd (24, 16) = 8
let%test _ = pgcd (12, 2) = 2
let%test _ = pgcd (1, 1) = 1




(*  Q :Quelles sont les préconditions ? Peut-on lever ces conditions 
      en utilisant une fonction locale ?
      
    R : Les préconditions sont : ((a >= 0) && (b >= 0) && (a=!0 || b!=0)
       On peut lever la condition (a>=0) && (b >= 0) en utilisant une 
       fonction locale abs
*)

let rec pgcd_abs  (a b) =
  let abs x = if x<0 then -x else x in
  if abs a = abs b then abs a
  else if abs a > abs b then pgcd_abs (abs a - abs b) (abs b)
  else pgcd_abs (abs a) (abs b - abs a)


let%test _ = pgcd_abs(-3,5)=1
let%test _ = pgcd_abs(6,3)=3
let%test _ = pgcd_abs(-3,6)=3
let%test _ = pgcd_abs(6,-6)=6
let%test _ = pgcd_abs(-0,6)=6
let%test _ = pgcd_abs(6,0)=6
let%test _ = pgcd_abs (24, -16) = 8
let%test _ = pgcd_abs (-12, 2) = 2
let%test _ = pgcd_abs (-1, 1) = 1



  
