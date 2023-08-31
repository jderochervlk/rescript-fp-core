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

test("filterWithIndex", _ => {
  [1, 2, 3]->Array.filterWithIndex((_, i) => i < 1)->expect->toEqual([1])
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
  []->Array.head->expect->toEqual(None)
})

test("tail", _ => {
  [1, 2, 3]->Array.tail->expect->toEqual(Some([2, 3]))
  [1]->Array.tail->expect->toEqual(None)
  []->Array.tail->expect->toEqual(None)
})

test("isEmpty", _ => {
  []->Array.isEmpty->expect->toEqual(true)
  [1, 2, 3]->Array.isEmpty->expect->toEqual(false)
})

test("lentgh", _ => {
  [1, 2, 3]->Array.length->expect->toEqual(3)
})

test("concat", _ => {
  [1, 2, 3]->Array.concat([4, 5, 6])->expect->toEqual([1, 2, 3, 4, 5, 6])
})

test("copy", _ => {
  [1, 2, 3]->Array.copy->expect->toEqual([1, 2, 3])
})

test("every", _ => {
  [1, 1, 1]->Array.every(n => n == 1)->expect->toEqual(true)
  [1, 2, 3]->Array.every(n => n == 1)->expect->toEqual(false)
})

test("findFirst", _ => {
  [1, 2, 3]->Array.findFirst(n => n == 1)->expect->toEqual(Some(1))
  [1, 2, 3]->Array.findFirst(n => n == 100)->expect->toEqual(None)
})

test("findUnsafeIndex", _ => {
  [1, 2, 3]->Array.findUnsafeIndex(n => n == 1)->expect->toEqual(0)
  [1, 2, 3]->Array.findUnsafeIndex(n => n == 10)->expect->toEqual(-1)
})

test("findIndex", _ => {
  [1, 2, 3]->Array.findIndex(n => n == 1)->expect->toEqual(Some(0))
  [1, 2, 3]->Array.findIndex(n => n == 10)->expect->toEqual(None)
})

test("some", _ => {
  [1, 2, 3]->Array.some(n => n == 1)->expect->toEqual(true)
  [1, 2, 3]->Array.some(n => n == 10)->expect->toEqual(false)
})

test("someWithIndex", _ => {
  [1, 2, 3]->Array.someWithIndex((n, i) => n + i == 1)->expect->toEqual(true)
  [1, 2, 3]->Array.someWithIndex((n, i) => n + i == 10)->expect->toEqual(false)
})

test("last", _ => {
  [1, 2, 3]->Array.last->expect->toEqual(Some(3))
  []->Array.last->expect->toEqual(None)
})

test("append", _ => {
  [2, 3]->Array.append(1)->expect->toEqual([2, 3, 1])
})

test("prepend", _ => {
  [2, 3]->Array.prepend(1)->expect->toEqual([1, 2, 3])
})

test("flatten", _ => {
  [[1, 2], [3, 4], [5, 6]]->Array.flatten->expect->toEqual([1, 2, 3, 4, 5, 6])
})

test("splice", _ => {
  [1, 2, 3]->Array.splice(~start=1, ~insert=[5], ~remove=0)->expect->toEqual([1, 5, 2, 3])
  [1, 2, 3]->Array.splice(~start=2, ~insert=[7, 8], ~remove=1)->expect->toEqual([1, 2, 7, 8])
})

test("sort", _ => {
  [3, 6, 2]->Array.sort((a, b) => a > b ? 0 : -1)->expect->toEqual([2, 3, 6])
})

test("getter", _ => {
  [1, 2, 3][1]->expect->toBe(Some(2))
})

test("sliceUnsafe", _ => {
  [1, 2, 3, 4]->Array.sliceUnsafe(0, 1)->expect->toEqual([1])
  [1, 2, 3, 4]->Array.sliceUnsafe(1, 4)->expect->toEqual([2, 3, 4])
  [1, 2, 3, 4]->Array.sliceUnsafe(10, 20)->expect->toEqual([])
})

test("slice", _ => {
  [1, 2, 3, 4]->Array.slice(0, 1)->expect->toEqual(Some([1]))
  [1, 2, 3, 4]->Array.slice(1, 4)->expect->toEqual(Some([2, 3, 4]))
  [1, 2, 3, 4]->Array.slice(10, 20)->expect->toEqual(None)
  [1, 2, 3, 4]->Array.slice(2, 1)->expect->toEqual(None)
  [1, 2, 3, 4]->Array.slice(0, 10)->expect->toEqual(None)
})

test("deleteAt", _ => {
  [1, 2, 3, 4]->Array.deleteAt(1)->expect->toEqual(Some([1, 3, 4]))
  [1, 2, 3, 4]->Array.deleteAt(0)->expect->toEqual(Some([2, 3, 4]))
  [1, 2, 3, 4]->Array.deleteAt(10)->expect->toEqual(None)
})

test("insertAt", _ => {
  [1, 2, 3, 4]->Array.insertAt(1, 100)->expect->toEqual(Some([1, 100, 2, 3, 4]))
  [1, 2, 3, 4]->Array.insertAt(0, 100)->expect->toEqual(Some([100, 1, 2, 3, 4]))
  [1, 2, 3, 4]->Array.insertAt(10, 100)->expect->toEqual(None)
  []->Array.insertAt(0, 100)->expect->toEqual(Some([100]))
})

test("modifyAt", _ => {
  [1, 2, 3]->Array.modifyAt(0, n => n + 100)->expect->toEqual(Some([101, 2, 3]))
  [1, 2, 3]->Array.modifyAt(100, n => n + 100)->expect->toEqual(None)
  []->Array.modifyAt(100, n => n + 100)->expect->toEqual(None)
})

test("updateAt", _ => {
  [1, 2, 3]->Array.updateAt(0, 100)->expect->toEqual(Some([100, 2, 3]))
  [1, 2, 3]->Array.updateAt(100, 100)->expect->toEqual(None)
  []->Array.updateAt(100, 100)->expect->toEqual(None)
})

test("reverse", _ => {
  [1, 2, 3]->Array.reverse->expect->toEqual([3, 2, 1])
})
