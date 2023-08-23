// v1
@send external map: (array<'a>, 'a => 'b) => array<'b> = "map"

@send external mapWithIndex: (array<'a>, ('a, int) => 'b) => array<'b> = "map"

@send external filter: (array<'a>, 'a => bool) => array<'a> = "filter"

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

let head = arr => arr->get(0)

let isEmpty = arr => {
  switch arr->head {
  | Some(_) => false
  | None => true
  }
}

@get external size: array<'a> => int = "length"
@get external length: array<'a> => int = "length"

@send external concat: (array<'a>, array<'a>) => array<'a> = "concat"

@send external copy: array<'a> => array<'a> = "slice"

@send external every: (array<'a>, 'a => bool) => bool = "every"

@send external findFirst: (array<'a>, 'a => bool) => option<'a> = "find"

@send external findIndex: (array<'a>, 'a => bool) => int = "findIndex"

// TODO: Core__Ordering?
// @send external toSorted: (array<'a>, ('a, 'a) => Core__Ordering.t) => array<'a> = "toSorted"
// @send external sort: (array<'a>, ('a, 'a) => Core__Ordering.t) => array<'a> = "toSorted"

@send external some: (array<'a>, 'a => bool) => bool = "some"
@send external someWithIndex: (array<'a>, ('a, int) => bool) => bool = "some"

let last = arr => {
  let index = arr->size - 1
  arr->get(index)
}

let append = (arr, t) => {
  [t]->concat(arr)
}

let prepend = (arr, t) => {
  arr->concat([t])
}

let flatten = arr => {
  arr->reduce([], (t1, t2) => t1->concat(t2))
}

@variadic @send
external splice: (array<'a>, ~start: int, ~remove: int, ~insert: array<'a>) => array<'a> =
  "toSpliced"

// deleteAt
// insertAt
// lookup
// modifyAt
// reverse
// splitAt
// tail
// updateAt
// zero

// next release
// sort
// soryBy
// chop
// compact
// filterMap
// filterMapWithIndex
// difference
// isOutOfBound
// uniq
