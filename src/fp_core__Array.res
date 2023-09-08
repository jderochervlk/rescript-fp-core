// opening belt to modify the behavior of array[0]
// when belt is open this returns an option<'a> instead of 'a
open Belt

@send external map: (array<'a>, 'a => 'b) => array<'b> = "map"

@send external mapWithIndex: (array<'a>, ('a, int) => 'b) => array<'b> = "map"

@send external filter: (array<'a>, 'a => bool) => array<'a> = "filter"
@send external filterWithIndex: (array<'a>, ('a, int) => bool) => array<'a> = "filter"

@send external reduce: (array<'b>, ('a, 'b) => 'a, 'a) => 'a = "reduce"
let reduce = (arr, init, f) => reduce(arr, f, init)

@send external reduceWithIndex: (array<'b>, ('a, 'b, int) => 'a, 'a) => 'a = "reduce"
let reduceWithIndex = (arr, init, f) => reduceWithIndex(arr, f, init)

@send
external reduceRight: (array<'b>, ('a, 'b) => 'a, 'a) => 'a = "reduceRight"
let reduceRight = (arr, init, f) => reduceRight(arr, f, init)

@send
external reduceRightWithIndex: (array<'b>, ('a, 'b, int) => 'a, 'a) => 'a = "reduceRight"
let reduceRightWithIndex = (arr, init, f) => reduceRightWithIndex(arr, f, init)

@get_index external get: (array<'a>, int) => option<'a> = ""

@get external size: array<'a> => int = "length"
@get external length: array<'a> => int = "length"

@send external concat: (array<'a>, array<'a>) => array<'a> = "concat"

@send external copy: array<'a> => array<'a> = "slice"

@send external every: (array<'a>, 'a => bool) => bool = "every"

@send external findFirst: (array<'a>, 'a => bool) => option<'a> = "find"

@send external findUnsafeIndex: (array<'a>, 'a => bool) => int = "findIndex"

let findIndex = (arr, fn) => {
  let idx = arr->findUnsafeIndex(fn)
  if idx < 0 {
    None
  } else {
    Some(idx)
  }
}

@send external sort: (array<'a>, ('a, 'a) => int) => array<'a> = "toSorted"

@send external some: (array<'a>, 'a => bool) => bool = "some"
@send external someWithIndex: (array<'a>, ('a, int) => bool) => bool = "some"

@variadic @send
external splice: (array<'a>, ~start: int, ~remove: int, ~insert: array<'a>) => array<'a> =
  "toSpliced"

@send external sliceUnsafe: (array<'a>, int, int) => array<'a> = "slice"

let last = arr => {
  let index = arr->size - 1
  arr->get(index)
}

let append = (arr, t) => {
  arr->concat([t])
}

let prepend = (arr, t) => {
  [t]->concat(arr)
}

let flatten = arr => {
  arr->reduce([], (t1, t2) => t1->concat(t2))
}

let slice = (arr, start, end) => {
  let len = arr->length
  switch len >= end && start < end && start < len {
  | true => Some(arr->sliceUnsafe(start, end))
  | false => None
  }
}

let head = arr => arr->get(0)

let tail = arr => {
  let len = arr->length
  arr->slice(0 + 1, len)
}

let isEmpty = arr => {
  switch arr->head {
  | Some(_) => false
  | None => true
  }
}

let deleteAt = (arr, i) => {
  let head = i == 0 ? arr->slice(-1, 0) : arr->slice(0, i)
  let tail = arr->slice(i + 1, arr->length)
  switch (head, tail) {
  | (Some(a), Some(b)) => Some(a->concat(b))
  | _ => None
  }
}

let insertAt = (arr, i, item) => {
  let len = arr->length
  let head = i == 0 ? arr->slice(-1, 0) : arr->slice(0, i)
  let tail = arr->slice(i, len)
  switch (head, tail, len) {
  | (Some(a), Some(b), _) => Some(a->concat([item])->concat(b))
  | (_, _, 0) => Some([item])
  | _ => None
  }
}

let modifyAt = (arr, i, updateFn) => {
  let len = arr->length
  let item = arr[i]
  let head = i == 0 ? arr->slice(-1, 0) : arr->slice(0, i)
  let tail = arr->slice(i + 1, len)
  switch (head, tail, item) {
  | (Some(a), Some(b), Some(i)) => Some(a->concat([updateFn(i)])->concat(b))
  | _ => None
  }
}

@send external reverse: array<'a> => array<'a> = "toReversed"

let updateAt = (arr, i, item) => {
  let len = arr->length
  let head = i == 0 ? arr->slice(-1, 0) : arr->slice(0, i)
  let tail = arr->slice(i + 1, len)
  switch (head, tail) {
  | (Some(a), Some(b)) => Some(a->concat([item])->concat(b))
  | _ => None
  }
}

@send external forEach: (array<'a>, 'a => unit) => unit = "forEach"

// next release
// chop
// compact
// filterMap
// filterMapWithIndex
// difference
// isOutOfBound
// uniq
