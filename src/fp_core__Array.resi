// Docs come from MDN and fp-ts
// sorted alphabetically, with the exception of keeping `unsafe` versions after the main version

/**
### append

Append an element to the end of an array, creating a new array.

#### Example
```rescript
[2, 3]->Array.append(1) // => [2, 3, 1]
```
*/
let append: (array<'a>, 'a) => array<'a>

/**
### concat
The concat function is used to merge two or more arrays. This method does not change the existing arrays, but instead returns a new array.

Zero-cost binding to Javascript's `Array.prototype.concat`.

#### Example
```rescript
[1, 2, 3]->Array.concat([4, 5, 6])- // => [1, 2, 3, 4, 5, 6]
```
*/
@send
external concat: (array<'a>, array<'a>) => array<'a> = "concat"

/**
### `copy`
This function takes an array and makes a new array containing the same elements.

Zero-cost binding to Javascript's `Array.prototype.slice`.

#### Example
```rescript
[1, 2, 3]->Array.copy // => [1, 2, 3]
```
*/
@send
external copy: array<'a> => array<'a> = "slice"

/**
### `deleteAt`
Delete the element at the specified index, creating a new array, or returning None if the index is out of bounds.

#### Example
```rescript
[1, 2, 3, 4]->Array.deleteAt(0) // => Some([2, 3, 4])
[1, 2, 3, 4]->Array.deleteAt(10) // => None
```
*/
let deleteAt: (array<'a>, int) => option<array<'a>>

/**
### `every`
every tells if the provided predicate holds true for every element in the Array.

Zero-cost binding to Javascript's `Array.prototype.every`.

#### Example
```rescript
[1, 1, 1]->Array.every(n => n == 1) // => true
[1, 2, 3]->Array.every(n => n == 1) // => false
```
*/
@send
external every: (array<'a>, 'a => bool) => bool = "every"

/**
### `filter`
Given an iterating function that is a Predicate or a Refinement, filter creates a new Array containing the elements of the original Array for which the iterating function is true.

Zero-cost binding to Javascript's `Array.prototype.filter`.

#### Example
```rescript
[1, 2, 3]->Array.filter(n => n <= 2) // => [1, 2]
```
*/
@send
external filter: (array<'a>, 'a => bool) => array<'a> = "filter"

/**
### `filterWithIndex`
Similar to `filter` but it includes the item's index.

Zero-cost binding to Javascript's `Array.prototype.filter`.

#### Example
```rescript
[1, 2, 3]->Array.filterWithIndex((_, i) => i < 1) // => [1]
```
*/
@send
external filterWithIndex: (array<'a>, ('a, int) => bool) => array<'a> = "filter"

/**
### `findFirst`

Find the first element which satisfies a predicate (or a refinement) function.
It returns an Option containing the element or None if not found.

#### Example
```rescript
[1, 2, 3]->Array.findFirst(n => n == 1) // => Some(1)
[1, 2, 3]->Array.findFirst(n => n == 100) // => None
```
*/
@send
external findFirst: (array<'a>, 'a => bool) => option<'a> = "find"

/**
### `findIndex`

findIndex returns an Option containing the first index for which a predicate holds. It returns None if no element satisfies the predicate. Similar to findFirst but returning the index instead of the element.

#### Example
```rescript
[1, 2, 3]->Array.findIndex(n => n == 1) // => Some(0)
[1, 2, 3]->Array.findIndex(n => n == 10) // => None
```
*/
let findIndex: (array<'a>, 'a => bool) => option<int>

/**
### `findUnsafeIndex`

Returns the index of the first element in an array that satisfies the provided testing function.
If no elements satisfy the testing function, -1 is returned. 

Zero-cost binding to Javascript's `Array.prototype.findIndex`.

#### Example
```rescript
[1, 2, 3]->Array.findUnsafeIndex(n => n == 1)->expect->toEqual(0)
[1, 2, 3]->Array.findUnsafeIndex(n => n == 10)->expect->toEqual(-1)
```
*/
@send
external findUnsafeIndex: (array<'a>, 'a => bool) => int = "findIndex"

/**
### `flatten`
Takes an array of arrays of `'a` and flattens them into an array of `'a` by concatenating the elements of each array in order.

#### Example
```rescript
[[1, 2], [3, 4], [5, 6]]->Array.flatten // => [1, 2, 3, 4, 5, 6]
```
*/
let flatten: array<array<'a>> => array<'a>

/**
### `get`
Gets the value from the given index, or `None` if the index is out of bounds.

#### Example
```rescript
[1, 2, 3]->Array.get(1) // => Some(2)
```
*/
@get_index
external get: (array<'a>, int) => option<'a> = ""

/**
### `head`
Get the first element in an array, or None if the array is empty

#### Example
```rescript
[1, 2, 3]->Array.head // => Some(1)
[]->Array.head // => None
*/
let head: array<'a> => option<'a>

/**
### `insertAt`
Inserts an element at the specified index, creating a new array, or returning `None` if the index is out of bounds.

#### Example
```rescript
[1, 2, 3, 4]->Array.insertAt(0, 100) // => Some([100, 1, 2, 3, 4])
[1, 2, 3, 4]->Array.insertAt(10, 100) // => None
[]->Array.insertAt(0, 100)->expect-> // => Some([100])
```
*/
let insertAt: (array<'a>, int, 'a) => option<array<'a>>

/**
### `isEmpty`
Test whether an array is empty

#### Example
```rescript
[]->Array.isEmpty // => true
[1, 2, 3]->Array.isEmpty // => false
```
*/
let isEmpty: array<'a> => bool

/**
### `last`

Get the last element in an array, or None if the array is empty

#### Example
```rescript
[1, 2, 3]->Array.last // => Some(3)
[]->Array.last // => None
```
*/
let last: array<'a> => option<'a>

/**
### `length`
Calculate the number of elements in a Array.

Zero-cost binding to Javascript's `Array.prototype.length`.

#### Example
```rescript
[1, 2, 3]->Array.length // => 3
```
*/
@get
external length: array<'a> => int = "length"

/**
### `map`
The `map` function creates a new array populated with the results of calling a provided function on every element in the calling array. 

Zero-cost binding to Javascript's `Array.prototype.map`.

#### Example
```rescript
[1, 2, 3]->Array.map(n => n + 1) // => [2,3,4]
```
*/
@send
external map: (array<'a>, 'a => 'b) => array<'b> = "map"

/**
### `mapWithIndex`
Similar to `map` but it also includes the array index of each item.

Zero-cost binding to Javascript's `Array.prototype.map`.

#### Example
```rescript
[1, 2, 3]->Array.mapWithIndex((n, i) => n + i) // => [1, 3, 5]
```
*/
@send
external mapWithIndex: (array<'a>, ('a, int) => 'b) => array<'b> = "map"

/**
### `modifyAt`
Apply a function to the element at the specified index, creating a new array, or returning `None` if the index is out of bounds.

#### Example
```rescript
[1, 2, 3]->Array.modifyAt(0, n => n + 100) // => Some([101, 2, 3]))
[1, 2, 3]->Array.modifyAt(100, n => n + 100) // => None
```
*/
let modifyAt: (array<'a>, int, 'a => 'a) => option<array<'a>>

/**
### `reduce`
Reduces an Array.

reduce executes the supplied iterating function on each element of the array, in order, passing in the element and the return value from the calculation on the preceding element.

The first time that the iterating function is called there is no “return value of the previous calculation”, the initial value is used in its place.

Zero-cost binding to Javascript's `Array.prototype.reduce`.

#### Example
```rescript
[1, 2, 3]->Array.reduce(0, (item, acc) => item + acc) // => 6
```
*/
let reduce: (array<'a>, 'b, ('b, 'a) => 'b) => 'b

/**
### `reduceWithIndex`
Similar to `reduce` but it includes each item's index.

Zero-cost binding to Javascript's `Array.prototype.reduce`.

#### Example
```rescript
[1, 2, 3]->Array.reduceWithIndex(0, (item, i, acc) => item + i + acc) // => 9
```
*/
let reduceWithIndex: (array<'a>, 'b, ('b, 'a, int) => 'b) => 'b

/**
Same as `reduce` but applied from the end to the start.

Zero-cost binding to Javascript's `Array.prototype.reduceRight`.

#### Example
```rescript
[1, 2, 3]->Array.reduceRight(0, (item, acc) => item + acc) // => 6
```
*/
let reduceRight: (array<'a>, 'b, ('b, 'a) => 'b) => 'b

/**
Same as `reduceRight` but includes the index for each item.

Zero-cost binding to Javascript's `Array.prototype.reduceRight`.

#### Example
```rescript
[1, 2, 3]->Array.reduceRightWithIndex(0, (item, i, acc) => item + i + acc) // => 9
```
*/
let reduceRightWithIndex: (array<'a>, 'b, ('b, 'a, int) => 'b) => 'b

/**
### `reverse`
Reverse an array, creating a new array
#### Example
```rescript
[1, 2, 3]->Array.reverse // => [3, 2, 1]
```
*/
@send
external reverse: array<'a> => array<'a> = "toReversed"

/**
### `slice`
Slices the array starting at the first int and ending just before the second int.

Returns `Some<array<'a>>` if start and end are in bounds.
Returns `None` if start or end are out of bounds, or if start is greater than end.

#### Example
```rescript
[1, 2, 3, 4]->Array.slice(1, 4) // => Some([2, 3, 4])
[1, 2, 3, 4]->Array.slice(10, 20) // => None
```
*/
let slice: (array<'a>, int, int) => option<array<'a>>

/**
### `sliceUnsafe`
Similar to `slice` but will return `array<'a>` instead of `Some<array<'a>>` and empty array instead of `None`

```rescript
[1, 2, 3, 4]->Array.slice(1, 4) // => [2, 3, 4]
[1, 2, 3, 4]->Array.slice(10, 20) // => []
```
*/
@send
external sliceUnsafe: (array<'a>, int, int) => array<'a> = "slice"

/**
### `some`

`some` tells if the provided predicate holds true at least for one element in the Array.

Zero-cost binding to Javascript's `Array.prototype.some`.

#### Example
```rescript
[1, 2, 3]->Array.some(n => n == 1) // => true
[1, 2, 3]->Array.some(n => n == 10)// => false
```
*/
@send
external some: (array<'a>, 'a => bool) => bool = "some"

/**
### `someWithIndex`
Similar to `some` but it includes an index with each item.

Zero-cost binding to Javascript's `Array.prototype.some`.

#### Example
```rescript
[1, 2, 3]->Array.someWithIndex((n, i) => n + i == 1) // => true
[1, 2, 3]->Array.someWithIndex((n, i) => n + i == 10) // => false
```
*/
@send
external someWithIndex: (array<'a>, ('a, int) => bool) => bool = "some"

/**
### `sort`
The sort function returns a sorted copy of the array using a compare function.

The compare function takes in two elements of the array at a time, `(a,b)`
and it will sort the items depending on the int returned.

Zero-cost binding to Javascript's `Array.prototype.toSorted`.

`> 0` - sort a after b, e.g. [b, a]

`< 0` -	sort a before b, e.g. [a, b]

`=== 0` - keep original order of a and b

#### Example
```rescript
[3, 6, 2]->Array.sort((a, b) => a > b ? 0 : -1) // => [2, 3, 6]
```
*/
@send
external sort: (array<'a>, ('a, 'a) => int) => array<'a> = "toSorted"

/**
### `splice`
The splice() function returns a new array with some elements removed and/or replaced at a given index.

Zero-cost binding to Javascript's `Array.prototype.toSpliced`.

#### Example
```rescript
[1, 2, 3]->Array.splice(~start=2, ~insert=[7, 8], ~remove=1) // => [1, 2, 7, 8]
```
*/
@variadic
@send
external splice: (array<'a>, ~start: int, ~remove: int, ~insert: array<'a>) => array<'a> =
  "toSpliced"

/**
### `tail`
Get all but the first element of an array, creating a new array, or None if the array is empty

#### Example
```rescript
[1, 2, 3]->Array.tail // => Some([2, 3])
[1]->Array.tail // =>None
```
*/
let tail: array<'a> => option<array<'a>>

/**
### `prepend`

Prepend an element to the start of an array, creating a new array.

#### Example
```rescript
[2, 3]->Array.prepend(1) // => [1, 2, 3]
```
*/
let prepend: (array<'a>, 'a) => array<'a>

/**
### `updateAt`
Change the element at the specified index, creating a new array, or returning None if the index is out of bounds.

#### Example
```rescript
[1, 2, 3]->Array.updateAt(0, 100) // =>Some([100, 2, 3])
[1, 2, 3]->Array.updateAt(100, 100) // => None
```
*/
let updateAt: (array<'a>, int, 'a) => option<array<'a>>
