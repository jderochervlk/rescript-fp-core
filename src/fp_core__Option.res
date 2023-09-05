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

let liftA1 = (f, opt) =>
  switch opt {
  | Some(x) => Some(f(x))
  | None => None
  }

let liftA2 = (f, opt1, opt2) =>
  switch (opt1, opt2) {
  | (Some(x1), Some(x2)) => Some(f(x1, x2))
  | _ => None
  }

let liftA3 = (f, opt1, opt2, opt3) =>
  switch (opt1, opt2, opt3) {
  | (Some(x1), Some(x2), Some(x3)) => Some(f(x1, x2, x3))
  | _ => None
  }

let map = (opt, f) =>
  switch opt {
  | Some(x) => Some(f(x))
  | None => None
  }

let map2 = (opt1, opt2, f) =>
  switch (opt1, opt2) {
  | (Some(x1), Some(x2)) => Some(f(x1, x2))
  | _ => None
  }

let map3 = (opt1, opt2, opt3, f) =>
  switch (opt1, opt2, opt3) {
  | (Some(x1), Some(x2), Some(x3)) => Some(f(x1, x2, x3))
  | _ => None
  }

let orElseRun = (opt, f) =>
  switch opt {
  | None => f()
  | Some(_) => ()
  }
