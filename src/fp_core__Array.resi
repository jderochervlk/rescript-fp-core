// ## JS Api methods
// ## Docs come from MDN and fp-ts

/**
## `map`
The `map` function creates a new array populated with the results of calling a provided function on every element in the calling array. 

### Example
```rescript
[1, 2, 3]->Array.map(n => n + 1) // => [2,3,4]
```
*/
@send
external map: (array<'a>, 'a => 'b) => array<'b> = "map"

/**
## `mapWithIndex`
Similar to `map` but it also includes the array index of each item.

### Example
```rescript
[1, 2, 3]->Array.mapWithIndex((n, i) => n + i) // => [1, 3, 5]
```
*/
@send
external mapWithIndex: (array<'a>, ('a, int) => 'b) => array<'b> = "map"

@send external filter: (array<'a>, 'a => bool) => array<'a> = "filter"

let reduce: (array<'a>, 'b, ('b, 'a) => 'b) => 'b

let reduceWithIndex: (array<'a>, 'b, ('b, 'a, int) => 'b) => 'b

let reduceRight: (array<'a>, 'b, ('b, 'a) => 'b) => 'b

let reduceRightWithIndex: (array<'a>, 'b, ('b, 'a, int) => 'b) => 'b

@get_index external get: (array<'a>, int) => option<'a> = ""

let head: array<'a> => option<'a>

let isEmpty: array<'a> => bool

@get external size: array<'a> => int = "length"
@get external length: array<'a> => int = "length"

@send external concat: (array<'a>, array<'a>) => array<'a> = "concat"

@send external copy: array<'a> => array<'a> = "slice"

@send external every: (array<'a>, 'a => bool) => bool = "every"

@send external findFirst: (array<'a>, 'a => bool) => option<'a> = "find"

@send external findIndex: (array<'a>, 'a => bool) => int = "findIndex"

@send external some: (array<'a>, 'a => bool) => bool = "some"

@send external someWithIndex: (array<'a>, ('a, int) => bool) => bool = "some"

let last: array<'a> => option<'a>

let append: (array<'a>, 'a) => array<'a>

let prepend: (array<'a>, 'a) => array<'a>

/**
## `flatten`
Takes an array of arrays of `'a` and flattens them into an array of `'a` by concatenating the elements of each array in order.

### Example
```rescript
[[1, 2], [3, 4], [5, 6]]->Array.flatten // => [1, 2, 3, 4, 5, 6]
```
*/
let flatten: array<array<'a>> => array<'a>

/**
## `splice`
The splice() function returns a new array with some elements removed and/or replaced at a given index.

### Example
```rescript
[1, 2, 3]->Array.splice(~start=2, ~insert=[7, 8], ~remove=1) // => [1, 2, 7, 8]
```
*/
@variadic
@send
external splice: (array<'a>, ~start: int, ~remove: int, ~insert: array<'a>) => array<'a> =
  "toSpliced"
