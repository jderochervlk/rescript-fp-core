// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";

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

function slice(arr, start, end) {
  var len = arr.length;
  if (len >= end && start < end && start < len) {
    return arr.slice(start, end);
  }
  
}

function deleteAt(arr, i) {
  var head = i === 0 ? slice(arr, -1, 0) : slice(arr, 0, i);
  var tail = slice(arr, i + 1 | 0, arr.length);
  if (head !== undefined && tail !== undefined) {
    return head.concat(tail);
  }
  
}

function insertAt(arr, i, item) {
  var len = arr.length;
  var head = i === 0 ? slice(arr, -1, 0) : slice(arr, 0, i);
  var tail = slice(arr, i, len);
  if (head !== undefined && tail !== undefined) {
    return head.concat([item]).concat(tail);
  }
  if (len !== 0) {
    return ;
  } else {
    return [item];
  }
}

function modifyAt(arr, i, updateFn) {
  var len = arr.length;
  var item = Belt_Array.get(arr, i);
  var head = i === 0 ? slice(arr, -1, 0) : slice(arr, 0, i);
  var tail = slice(arr, i + 1 | 0, len);
  if (head !== undefined && tail !== undefined && item !== undefined) {
    return head.concat([Curry._1(updateFn, Caml_option.valFromOption(item))]).concat(tail);
  }
  
}

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
  slice ,
  deleteAt ,
  insertAt ,
  modifyAt ,
}
/* No side effect */
