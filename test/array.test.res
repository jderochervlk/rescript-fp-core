open Vitest
open Expect
open FpCore

test("map", _ => {
  [1, 2, 3]->Array.map(n => n + 1)->expect->toEqual([2, 3, 4])
})

test("mapWithIndex", _ => {
  [1, 2, 3]->Array.mapWithIndex((n, i) => n + i)->expect->toEqual([1, 3, 5])
})

test("filter", _ => {
  [1, 2, 3]->Array.filter(n => n <= 2)->expect->toEqual([1, 2])
})

test("reduce", _ => {
  [1, 2, 3]->Array.reduce(0, (item, acc) => item + acc)->expect->toEqual(6)
})

test("reduceWithIndex", _ => {
  [1, 2, 3]->Array.reduceWithIndex(0, (item, i, acc) => item + i + acc)->expect->toEqual(9)
})

test("reduceRight", _ => {
  [1, 2, 3]->Array.reduceRight(0, (item, acc) => item + acc)->expect->toEqual(6)
})

test("reduceRightWithIndex", _ => {
  [1, 2, 3]->Array.reduceRightWithIndex(0, (item, i, acc) => item + i + acc)->expect->toEqual(9)
})

test("get", _ => {
  [1, 2, 3]->Array.get(1)->expect->toEqual(Some(2))
})

test("head", _ => {
  [1, 2, 3]->Array.head->expect->toEqual(Some(1))
})
