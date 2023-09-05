open Vitest
open Expect
open FpCore

test("catchMap", _ => {
  Some(42)->Option.catchMap(() => 100)->expect->toEqual(Some(42))
  None->Option.catchMap(() => 100)->expect->toEqual(Some(100))
})

test("chain", _ => {
  Some(42)->Option.chain(t => t < 100 ? Some(t) : None)->expect->toEqual(Some(42))
  Some(400)->Option.chain(t => t < 100 ? Some(t) : None)->expect->toEqual(None)
  None->Option.chain(t => t < 100 ? Some(t) : None)->expect->toEqual(None)
})

test("filter", _ => {
  Some(42)->Option.filter(n => n == 42)->expect->toEqual(Some(42))
  Some(42)->Option.filter(n => n != 42)->expect->toEqual(None)
  None->Option.filter(n => n != 42)->expect->toEqual(None)
})

test("fold", _ => {
  Some(42)
  ->Option.fold(() => "no number", t => "the number is " ++ t->Js.Int.toString)
  ->expect
  ->toEqual("the number is 42")
})

test("forEach", _ => {
  let t1 = []
  let t2 = []
  Some(42)->Option.forEach(n => {
    let _t = t1->Js.Array2.push(n)
  })
  t1->expect->toEqual([42])

  None->Option.forEach(n => {
    let _t = t2->Js.Array2.push(n)
  })
  t2->expect->toEqual([])
})

test("getOrElse", _ => {
  Some(42)->Option.getOrElse(() => 100)->expect->toEqual(42)
  None->Option.getOrElse(() => 100)->expect->toEqual(100)
})

test("isNone", _ => {
  Some(42)->Option.isNone->expect->toBe(false)
  None->Option.isNone->expect->toBe(true)
})

test("isSome", _ => {
  Some(42)->Option.isSome->expect->toBe(true)
  None->Option.isSome->expect->toBe(false)
})

test("map", _ => {
  Some(42)->Option.map(n => n + 10)->expect->toEqual(Some(52))
  None->Option.map(n => n + 10)->expect->toEqual(None)
})
