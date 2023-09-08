open Vitest
open Expect
open FpCore

test("set", _ => {
  let t1 = {"foo": "bar"}
  let t2 = t1->Object.set("foo", "new")
  t1->expect->toEqual({"foo": "bar"})
  t2->expect->toEqual({"foo": "new"})
})

test("merge", _ => {
  let t1 = {"foo": "bar"}
  let t2 = {"bar": "foo"}
  let t3 = Object.merge(t1, t2)
  t3->expect->toEqual({"foo": "bar", "bar": "foo"})
  t1->expect->toEqual({"foo": "bar"})
  t2->expect->toEqual({"bar": "foo"})
})

test("deleteAt", _ => {
  let t1 = {"foo": "bar", "bar": "foo"}
  let t2 = t1->Object.deleteAt("bar")
  t1->expect->toEqual({"foo": "bar", "bar": "foo"})
  t2->expect->toEqual({"foo": "bar"})
})

test("get", _ => {
  {"a": 1}->Object.get("a")->expect->toEqual(Some(1))
  {"a": 1}->Object.get("b")->expect->toEqual(None)
})

test("has", _ => {
  {"a": 1}->Object.has("a")->expect->toEqual(true)
  {"a": 1}->Object.has("b")->expect->toEqual(false)
})

test("map", _ => {
  let t1 = {"a": 1, "b": 2}
  let t2 = t1->Object.map(n => n + 10)
  t2->expect->toEqual({"a": 11, "b": 12})
  t1->expect->toEqual({"a": 1, "b": 2})
})

test("isEmpty", _ => {
  %raw("{}")->Object.isEmpty->expect->toEqual(true)
  {"foo": "bar"}->Object.isEmpty->expect->toEqual(false)
})

test("filter", _ => {
  {"one": 1, "two": 2}->Object.filter(n => n < 2)->expect->toEqual({"one": 1})
})
