import gleam/list
import gleam/int

pub fn square_of_sum(n: Int) -> Int {
  list.range(1, n)
  |> list.fold(0, fn(a, b) { a + b })
  |> fn(x) { x * x }
}

pub fn sum_of_squares(n: Int) -> Int {
  list.range(1, n)
  |> list.fold(0, fn(a, b) { a + b * b })
}

pub fn difference(n: Int) -> Int {
  int.sum([square_of_sum(n), -sum_of_squares(n)])
}
