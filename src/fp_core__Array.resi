// ## JS Api methods
// ## Docs come from MDN

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
[1, 2, 3]->Fp_core__Array.mapWithIndex((n, i) => n + i) // => [1, 3, 5]
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
