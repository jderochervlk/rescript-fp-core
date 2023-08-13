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
// isNoneEmpty
// flatten
// append
// chop
// concat
// copy
// deleteAt
// every
// findFirst
// findIndex

// insertAt
// last
// lookup
// modifyAt
// prepend
// reverse
// size - length
// some
// sort
// soryBy
// splitAt
// tail
// updateAt
// zero

// v2
// compact
// filterMap
// filterMapWithIndex
// difference
// isOutOfBound
// uniq
