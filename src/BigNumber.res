type t;

@new @module external fromString: string => t = "bignumber.js";
@new @module external fromInt: int => t = "bignumber.js";

@send external toInt: t => int = "toNumber";
@send external toFloat: t => float = "toNumber";
@send external toString: t => string = "toString";
@send external toFixed: (t, option<int>) => string = "toFixed";
@send external plus: (t, t) => t = "plus";
@send external isNaN: t => bool = "isNaN";
@send external integerValue: t => t = "integerValue";
@send external isInteger: t => bool = "isInteger";
@send external isNegative: t => bool = "isNegative";
@send external div: (t, t) => t = "div";
@send external times: (t, t) => t = "times";
@send external powInt: (t, int) => t = "pow";
@send external isEqualTo: (t, t) => bool = "isEqualTo";

let toFixed = (~decimals=?, t) => toFixed(t, decimals);

let fromInt64 = i => i->Int64.to_string->fromString;
let toInt64 = i => i->toFixed->Int64.of_string;
