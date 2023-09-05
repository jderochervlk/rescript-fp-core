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
### map
Takes a function `'a => 'b` and applies that function to the value inside the option and returns another option.

#### Example
```rescript
Some(42)->Option.map(n => n + 10) // => Some(52)
None->Option.map(n => n + 10) // => None
```
*/
let map: (option<'a>, 'a => 'b) => option<'b>
