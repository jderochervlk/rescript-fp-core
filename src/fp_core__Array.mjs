// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Belt_Array from "rescript/lib/es6/belt_Array.js";

function reduce(arr, init, f) {
  return arr.reduce(f, init);
}

function reduceWithIndex(arr, init, f) {
  return arr.reduce(f, init);
}

function reduceRight(arr, init, f) {
  return arr.reduceRight(f, init);
}

function reduceRightWithIndex(arr, init, f) {
  return arr.reduceRight(f, init);
}

function head(arr) {
  return arr[0];
}

function isEmpty(arr) {
  var match = arr[0];
  return match === undefined;
}

function last(arr) {
  var index = arr.length - 1 | 0;
  return arr[index];
}

function append(arr, t) {
  return [t].concat(arr);
}

function prepend(arr, t) {
  return arr.concat([t]);
}

function flatten(arr) {
  return arr.reduce((function (t1, t2) {
                return t1.concat(t2);
              }), []);
}

var lookup = Belt_Array.get;

export {
  reduce ,
  reduceWithIndex ,
  reduceRight ,
  reduceRightWithIndex ,
  head ,
  isEmpty ,
  last ,
  append ,
  prepend ,
  flatten ,
  lookup ,
}
/* No side effect */
