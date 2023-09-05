open Vitest
open Expect
open FpCore

// just a quick smoke test to make sure Promise from Core is available

testAsync("promise", async _ => {
  let res = await Promise.resolve(42)
  res->expect->toEqual(42)
})
