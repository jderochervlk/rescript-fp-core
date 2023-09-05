let catchMap = (opt, f) =>
  switch opt {
  | Some(x) => Some(x)
  | None => Some(f())
  }

let chain = (opt, f) =>
  switch opt {
  | Some(x) => f(x)
  | None => None
  }

let filter = (opt, f) =>
  switch opt {
  | Some(x) =>
    switch f(x) {
    | true => Some(x)
    | false => None
    }
  | None => None
  }

let fold = (opt, noneFn, someFn) =>
  switch opt {
  | Some(x) => someFn(x)
  | None => noneFn()
  }

let forEach = (opt, f) =>
  switch opt {
  | Some(x) => f(x)
  | None => ()
  }

let getOrElse = (opt, v) =>
  switch opt {
  | Some(x) => x
  | None => v()
  }

let isNone = opt =>
  switch opt {
  | None => true
  | Some(_) => false
  }

let isSome = opt =>
  switch opt {
  | Some(_) => true
  | None => false
  }

let map = (opt, f) =>
  switch opt {
  | Some(x) => Some(f(x))
  | None => None
  }

let orElseRun = (opt, f) =>
  switch opt {
  | None => f()
  | Some(_) => ()
  }
