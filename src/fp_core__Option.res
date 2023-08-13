let map = (opt, f) => {
  switch opt {
  | Some(x) => Some(f(x))
  | None => None
  }
}
