// functions to work with JS Objects
// fp-ts Record functions

/**
internal
*/
@val
external assign1: ({.}, {..}) => {..} = "Object.assign"

/**
internal
*/
@val
external assign2: ({.}, {..}, {..}) => {..} = "Object.assign"

/**
internal
*/
@obj
external empty: unit => {..} = ""

/**
internal
*/
@set_index
external set: ({..}, string, 'a) => unit = ""

/**
internal
*/
let deleteInternal: ({..}, string) => unit = %raw("(obj, key) => { delete obj[key] }")

@get_index
external unsafeGet: ({..}, string) => 'a = ""

@get_index
external get: ({..}, string) => option<'a> = ""

@val
external keysToArray: {..} => array<string> = "Object.keys"

@val
external has: ({..}, string) => bool = "Object.prototype.hasOwnProperty.call"

let set = (obj, key, val) => {
  let clone = assign1(empty(), obj)
  clone->set(key, val)
  clone
}

let merge = (obj1, obj2) => assign2(empty(), obj1, obj2)

let deleteAt = (obj, key) => {
  let clone = assign1(empty(), obj)
  deleteInternal(clone, key)
  clone
}

let map = (obj, f) => {
  let keys = obj->keysToArray
  keys->Fp_core__Array.reduce(empty(), (acc, key) => {
    let updatedValue = obj->unsafeGet(key)->f
    acc->set(key, updatedValue)
  })
}

let isEmpty = o => o->keysToArray->Fp_core__Array.length == 0

let filter = (obj, f) => {
  let keys = obj->keysToArray
  keys->Fp_core__Array.reduce(empty(), (acc, key) => {
    let value = obj->unsafeGet(key)
    let pass = value->f
    if pass {
      acc->set(key, value)
    } else {
      acc
    }
  })
}
