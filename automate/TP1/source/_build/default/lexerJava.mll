{

  open TokenJava
(*  open String *)
(*  open Str *)
  exception LexicalError

}

(* Macro-definitions *)
let minuscule = ['a'-'z']
let majuscule = ['A'-'Z']
let chiffre = ['0'-'9']
let alphabet = minuscule | majuscule
let alphanum = alphabet | chiffre | '_'
let commentaireBloc = "/*" [^'*']* '*'* [^'/' '*']* "*/"
let commentaireLigne = "//" [^'\n']* '\n'

let Underscore = '_'
let  Underscores = Underscore Underscore*

let integerTypeSuffix = ['l' 'L']
(*DecimalNumeral:
    0
    NonZeroDigit Digitsopt
    NonZeroDigit Underscores Digits*)
let NonZeroDigit = ['1'-'9']
let Digit = '0' | NonZeroDigit
let DigitOrUnderscore = Digit | Underscores
let DigitsAndUnderscores = DigitOrUnderscore DigitOrUnderscore*
let Digits = Digit | Digit DigitsAndUnderscores? Digit
let DecimalNumeral = '0'|NonZeroDigit (Digit)? | NonZeroDigit Underscores Digits

(*HexNumeral:
    0 x HexDigits
    0 X HexDigits *)
let HexDigit = Digit | ['a'-'f' 'A'-'F']
let HexDigitOrUnderscore = HexDigit | Underscores
let HexDigitsAndUnderscores = HexDigitOrUnderscore HexDigitOrUnderscore*
let HexDigits = HexDigit | HexDigit HexDigitsAndUnderscores? HexDigit
let HexNumeral = '0' ['x' 'X'] HexDigits

(*OctalNumeral:
    0 OctalDigits
    0 Underscores OctalDigits*)

(*OctalNumeral:
    0 OctalDigits
    0 Underscores OctalDigits*)
let OctalDigit = ['0'-'7']
let OctalDigitOrUnderscore = OctalDigit | Underscore
let OctalDigitsAndUnderscores = OctalDigitOrUnderscore OctalDigitOrUnderscore*
let OctalDigits = OctalDigit | OctalDigit OctalDigitsAndUnderscores? OctalDigit
let OctalNumeral = '0' OctalDigits | '0' Underscores OctalDigits

(*BinaryNumeral:
    0 b BinaryDigits
    0 B BinaryDigits*)
let BinaryDigit = ['0'-'1']
let BinaryDigitOrUnderscore = BinaryDigit | Underscore
let BinaryDigitsAndUnderscores = BinaryDigitOrUnderscore BinaryDigitOrUnderscore*
let BinaryDigits = BinaryDigit | BinaryDigit BinaryDigitsAndUnderscores? BinaryDigit
let BinaryNumeral = '0' ['b' 'B'] BinaryDigits


(*HexadecimalFloatingPointLiteral:
    HexSignificand BinaryExponent FloatTypeSuffixopt
   *)
   let BinaryExponentIndicator = ['p' 'P']
    let FloatTypeSuffix = ['f' 'F' 'd' 'D']
    let SignedInteger = ['+' '-']? Digits
    let BinaryExponent = BinaryExponentIndicator SignedInteger
    let HexSignificand = HexNumeral | HexNumeral? '.' HexNumeral | HexNumeral '.'?
    let HexadecimalFloatingPointLiteral = HexSignificand BinaryExponent FloatTypeSuffix?
(*FloatingPointLiteral:
    DecimalFloatingPointLiteral
    HexadecimalFloatingPointLiteral*)
let sign = ['+' '-']
let exponentIndicator = ['e' 'E']
let signedInteger = sign? Digits
let exponentPart = exponentIndicator signedInteger
let DecimalFloatingPointLiteral = Digits '.' Digits? exponentPart? FloatTypeSuffix?
                                  | '.' Digits exponentPart? FloatTypeSuffix?
                                  | Digits exponentPart FloatTypeSuffix?
                                  | Digits exponentPart? FloatTypeSuffix
let FloatingPointLiteral = DecimalFloatingPointLiteral | HexadecimalFloatingPointLiteral

(*CharacterLiteral:
    ' SingleCharacter '
    ' EscapeSequence ' *)
let SingleCharacter = [^'\'' '\\']
let ZerotoThree = ['0'-'3']
let OctalDigit = ['0'-'7']
let OctalEscape =  ZerotoThree OctalDigit OctalDigit | OctalDigit OctalDigit | ZerotoThree OctalDigit
let EscapeSequence = '\\' ['b' 't' 'n' 'f' 'r' '"' '\'' '\\' '0'] | '\\' OctalEscape 




(* Analyseur lexical : expression reguliere { action CaML } *)
rule lexer = parse
(* Espace, tabulation, passage a ligne, etc : consommes par l'analyse lexicale *)
  | ['\n' '\t' ' ']+    { lexer lexbuf }
(* Commentaires consommes par l'analyse lexicale *)
  | commentaireBloc  	{ lexer lexbuf }
  | commentaireLigne	{ lexer lexbuf }
(* Structures de blocs *)
  | "("                 { PAROUV }
  | ")"                 { PARFER }
  | "["                 { CROOUV }
  | "]"                 { CROFER }
  | "{"                 { ACCOUV }
  | "}"                 { ACCFER }
(* Separateurs *)
  | ","                 { VIRG }
  | ";"                 { PTVIRG }
(* Operateurs booleens *)
  | "||"                { OPOU }
  | "&&"                { OPET }
  | "!"                 { OPNON }
(* Operateurs comparaisons *)
  | "=="                { OPEG }
  | "!="                { OPNONEG }
  | "<="                { OPSUPEG }
  | "<"                 { OPSUP }
  | ">="                { OPINFEG }
  | ">"                 { OPINF }
(* Operateurs arithmetiques *)
  | "+"                 { OPPLUS }
  | "-"                 { OPMOINS }
  | "*"                 { OPMULT }
  | "/"                 { OPDIV }
  | "%"                 { OPMOD }
  | "."                 { OPPT }
  | "="                 { ASSIGN }
  | "new"               { NOUVEAU }
(* Mots cles : types *)
  | "bool"              { BOOL }
  | "char"              { CHAR }
  | "float"             { FLOAT }
  | "int"               { INT }
  | "String"            { STRING }
  | "void"              { VOID }
(* Mots cles : instructions *)
  | "while"		{ TANTQUE }
  | "if"		{ SI }
  | "else"		{ SINON }
  | "return"		{ RETOUR }
(* Mots cles : constantes *)
  | "true"		{ (BOOLEEN true) }
  | "false"		{ (BOOLEEN false) }
  | "null"		{ VIDE }
(* Integer Literals *)
  | DecimalNumeral  integerTypeSuffix?  as texte  { ENTIER (int_of_string texte) }
  | HexNumeral  integerTypeSuffix?  as texte      { ENTIER (int_of_string texte) }
  | OctalNumeral  integerTypeSuffix?  as texte    { ENTIER (int_of_string texte) }
  | BinaryNumeral  integerTypeSuffix?  as texte   { ENTIER (int_of_string texte) }
(* Floating-Point Literals *)
  | FloatingPointLiteral as texte                { FLOTTANT (float_of_string texte) }
  | HexadecimalFloatingPointLiteral as texte     { FLOTTANT (float_of_string texte) }
(* Caracteres : A COMPLETER *)
  | "'" _* "'" as texte                  { CARACTERE texte.[1] }
  | "'" _* EscapeSequence _* "'" as texte { CARACTERE texte.[1] }
(* Chaines de caracteres : A COMPLETER *)
  | '"' _* '"' as texte                  { CHAINE texte }
  | '"' _* [^'"']* _* '"' as texte       { CHAINE texte }

(* Identificateurs *)
  | majuscule alphanum* as texte              { TYPEIDENT texte }
  | minuscule alphanum* as texte              { IDENT texte }
  | eof                                       { FIN }
  | _                                         { raise LexicalError }

{

}
