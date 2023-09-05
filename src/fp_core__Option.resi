/**
### catchMap
Takes a function that returns an `option`. It returns output of function if source `option` is `None`.

#### Example
```rescript
Some(42)->Option.catchMap(() => 100) // => Some(42)
None->Option.catchMap(() => 100) //=> Some(100)
```
*/
let catchMap: (option<'a>, unit => 'a) => option<'a>

/**
### chain
Takes a function `'a => option<'b>` and applies that function to the value inside the option and returns another option.

#### Example
```rescript
Some(42)->Option.chain(t => t < 100 ? Some(t) : None) // => Some(42)
Some(400)->Option.chain(t => t < 100 ? Some(t) : None) // => None
None->Option.chain(t => t < 100 ? Some(t) : None) // => None
```
*/
let chain: (option<'a>, 'a => option<'b>) => option<'b>

/**
### filter
Convert to `None` if predicate function return falsy value, otherwise return the same `Just`.

#### Example
```rescript
Some(42)->Option.filter(n => n == 42) // => Some(42)
Some(42)->Option.filter(n => n != 42) // => None
None->Option.filter(n => n != 42) // => None
```
*/
let filter: (option<'a>, 'a => bool) => option<'a>

/**
### fold
Takes a (lazy) default value, a function, and an Option value, if the Option value is None the default value is returned, otherwise the function is applied to the value inside the Some and the result is returned.

#### Example
```rescript
Some(42)->Option.fold(() => "no number", t => "the number is " ++ t->Js.Int.toString) // => "the number is 42"
```
*/
let fold: (option<'a>, unit => 'b, 'a => 'b) => 'b

/**
### forEach
Invoke a function applying a side-effect on the contents of the option if any.

#### Example
```rescript
Some(42)->Option.forEach(Js.Console.log) // => logs 42 to the console
```
*/
let forEach: (option<'a>, 'a => unit) => unit

/**
### getOrElse
Extracts the value out of the structure, if it exists. Otherwise returns the given default value.

#### Example
```rescript
Some(42)->Option.getOrElse(() => 100) // => 42
None->Option.getOrElse(() => 100) // => 100
```
*/
let getOrElse: (option<'a>, unit => 'a) => 'a

/**
### isNone
Returns true if the option is None, false otherwise.

#### Example
```rescript
Some(42)->Option.isNone // => false
None->Option.isNone // => true
```
*/
let isNone: option<'a> => bool

/**
### isSome
Returns true if the option is Some, false otherwise.

#### Example
```rescript
Some(42)->Option.isNone // => false
None->Option.isNone // => true
```
*/
let isSome: option<'a> => bool

/**
### liftA1
converts a function `('a) => 'b` to `(option<'a>) => option<'b>`

#### Example
```rescript
let increment = n => n + 1
let liftedIncrement = Option.liftA1(increment)
Some(42)->liftedIncrement // => Some(43)
```
*/
let liftA1: ('a => 'b, option<'a>) => option<'b>

/**
### liftA2
converts a function `('a, 'b) => 'c` to `(option<'a>, option<'b>) => option<'c>`

#### Example
```rescript
let sum = (n1, n2) => n1 + n2
let liftedSum = Option.liftA2(sum)
liftedSum(Some(100), Some(42)) // => Some(142)
```
*/
let liftA2: (('a, 'b) => 'c, option<'a>, option<'b>) => option<'c>

/**
### liftA3
converts a function `('a) => 'b` to `(option<'a>) => option<'b>`

#### Example
```rescript
let sum = (n1, n2, n3) => n1 + n2 + n3
let liftedSum = Option.liftA3(sum)
liftedSum(Some(100), Some(42), Some(100)) // => Some(242)
```
*/
let liftA3: (('a, 'b, 'c) => 'd, option<'a>, option<'b>, option<'c>) => option<'d>

/**
### map
Takes a function `'a => 'b` and applies that function to the value inside the option and returns another option.

#### Example
```rescript
Some(42)->Option.map(n => n + 10) // => Some(52)
None->Option.map(n => n + 10) // => None
```
*/
let map: (option<'a>, 'a => 'b) => option<'b>

/**
### map2
Takes a function `('a, 'b) => 'c` and applies that function to the values inside the options and returns another option.

#### Example
```rescript
let sum = (n1, n2) => n1 + n2
Some(42)->Option.map2(Some(100), sum) // => Some(142)
```
*/
let map2: (option<'a>, option<'b>, ('a, 'b) => 'c) => option<'c>

/**
### map3
Takes a function `('a, 'b, 'c) => 'd` and applies that function to the values inside the options and returns another option.

#### Example
```rescript
let sum = (n1, n2, n3) => n1 + n2 + n3
Some(42)->Option.map3(Some(100), Some(100), sum) // => Some(242)
```
*/
let map3: (option<'a>, option<'b>, option<'c>, ('a, 'b, 'c) => 'd) => option<'d>

/**
### orElseRun
Invoke a parameterless side-effecting function if the option is None.

#### Example
```rescript
None->Option.forEach(() => Js.Console.log(42)) // => logs 42 to the console
```
*/
let orElseRun: (option<'a>, unit => unit) => unit
