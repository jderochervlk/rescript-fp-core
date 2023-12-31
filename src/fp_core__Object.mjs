// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as Fp_core__Array from "./fp_core__Array.mjs";

var deleteInternal = ((obj, key) => { delete obj[key] });

function set(obj, key, val) {
  var clone = Object.assign({}, obj);
  clone[key] = val;
  return clone;
}

function merge(obj1, obj2) {
  return Object.assign({}, obj1, obj2);
}

function deleteAt(obj, key) {
  var clone = Object.assign({}, obj);
  deleteInternal(clone, key);
  return clone;
}

function map(obj, f) {
  var keys = Object.keys(obj);
  return Fp_core__Array.reduce(keys, {}, (function (acc, key) {
                var updatedValue = Curry._1(f, obj[key]);
                return set(acc, key, updatedValue);
              }));
}

function isEmpty(o) {
  return Object.keys(o).length === 0;
}

function filter(obj, f) {
  var keys = Object.keys(obj);
  return Fp_core__Array.reduce(keys, {}, (function (acc, key) {
                var value = obj[key];
                var pass = Curry._1(f, value);
                if (pass) {
                  return set(acc, key, value);
                } else {
                  return acc;
                }
              }));
}

export {
  deleteAt ,
  isEmpty ,
  filter ,
  map ,
  merge ,
  set ,
}
/* No side effect */
