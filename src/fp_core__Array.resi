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

/**
## `sort`
The sort function returns a sorted copy of the array using a compare function.

The compare function takes in two elements of the array at a time, `(a,b)`
and it will sort the items depending on the int returned.

`> 0` - sort a after b, e.g. [b, a]

`< 0` -	sort a before b, e.g. [a, b]

`=== 0` - keep original order of a and b

### Example
```rescript
[3, 6, 2]->Array.sort((a, b) => a > b ? 0 : -1) // => [2, 3, 6]
```
*/
@send
external sort: (array<'a>, ('a, 'a) => int) => array<'a> = "toSorted"

/**
This function provides a safe way to read a value at a particular index from an array. 
It returns a `none` if the index is out of bounds, and a `some` of the element if the index is valid.
*/
let lookup: (array<'a>, int) => option<'a>

/**
## `unsafeSlice`
Similar to `slice` but will return `array<'a>` instead of `Some<array<'a>>` and empty array instead of `None`

```rescript
[1, 2, 3, 4]->Array.slice(1, 4) // => [2, 3, 4]
[1, 2, 3, 4]->Array.slice(10, 20) // => []
```
*/
@send
external unsafeSlice: (array<'a>, int, int) => array<'a> = "slice"

/**
## `slice`
Slices the array starting at the first int and ending just before the second int.

Returns `Some<array<'a>>` if start and end are in bounds.
Returns `None` if start or end are out of bounds, or if start is greater than end.

### Example
```rescript
[1, 2, 3, 4]->Array.slice(1, 4) // => Some([2, 3, 4])
[1, 2, 3, 4]->Array.slice(10, 20) // => None
```
*/
let slice: (array<'a>, int, int) => option<array<'a>>

/**
deleteAt
Delete the element at the specified index, creating a new array, or returning None if the index is out of bounds.
*/
let deleteAt: (array<'a>, int) => option<array<'a>>
