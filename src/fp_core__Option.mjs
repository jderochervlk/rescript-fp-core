// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";

function catchMap(opt, f) {
  if (opt !== undefined) {
    return Caml_option.some(Caml_option.valFromOption(opt));
  } else {
    return Caml_option.some(Curry._1(f, undefined));
  }
}

function chain(opt, f) {
  if (opt !== undefined) {
    return Curry._1(f, Caml_option.valFromOption(opt));
  }
  
}

function filter(opt, f) {
  if (opt === undefined) {
    return ;
  }
  var x = Caml_option.valFromOption(opt);
  if (Curry._1(f, x)) {
    return Caml_option.some(x);
  }
  
}

function fold(opt, noneFn, someFn) {
  if (opt !== undefined) {
    return Curry._1(someFn, Caml_option.valFromOption(opt));
  } else {
    return Curry._1(noneFn, undefined);
  }
}

function forEach(opt, f) {
  if (opt !== undefined) {
    return Curry._1(f, Caml_option.valFromOption(opt));
  }
  
}

function getOrElse(opt, v) {
  if (opt !== undefined) {
    return Caml_option.valFromOption(opt);
  } else {
    return Curry._1(v, undefined);
  }
}

function isNone(opt) {
  return opt === undefined;
}

function isSome(opt) {
  return opt !== undefined;
}

function liftA1(f, opt) {
  if (opt !== undefined) {
    return Caml_option.some(Curry._1(f, Caml_option.valFromOption(opt)));
  }
  
}

function liftA2(f, opt1, opt2) {
  if (opt1 !== undefined && opt2 !== undefined) {
    return Caml_option.some(Curry._2(f, Caml_option.valFromOption(opt1), Caml_option.valFromOption(opt2)));
  }
  
}

function liftA3(f, opt1, opt2, opt3) {
  if (opt1 !== undefined && opt2 !== undefined && opt3 !== undefined) {
    return Caml_option.some(Curry._3(f, Caml_option.valFromOption(opt1), Caml_option.valFromOption(opt2), Caml_option.valFromOption(opt3)));
  }
  
}

function map(opt, f) {
  if (opt !== undefined) {
    return Caml_option.some(Curry._1(f, Caml_option.valFromOption(opt)));
  }
  
}

function map2(opt1, opt2, f) {
  if (opt1 !== undefined && opt2 !== undefined) {
    return Caml_option.some(Curry._2(f, Caml_option.valFromOption(opt1), Caml_option.valFromOption(opt2)));
  }
  
}

function map3(opt1, opt2, opt3, f) {
  if (opt1 !== undefined && opt2 !== undefined && opt3 !== undefined) {
    return Caml_option.some(Curry._3(f, Caml_option.valFromOption(opt1), Caml_option.valFromOption(opt2), Caml_option.valFromOption(opt3)));
  }
  
}

function orElseRun(opt, f) {
  if (opt !== undefined) {
    return ;
  } else {
    return Curry._1(f, undefined);
  }
}

export {
  catchMap ,
  chain ,
  filter ,
  fold ,
  forEach ,
  getOrElse ,
  isNone ,
  isSome ,
  liftA1 ,
  liftA2 ,
  liftA3 ,
  map ,
  map2 ,
  map3 ,
  orElseRun ,
}
/* No side effect */