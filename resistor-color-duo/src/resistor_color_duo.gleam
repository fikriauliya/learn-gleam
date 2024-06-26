import gleam/list
import gleam/result

pub type Color {
  Black
  Brown
  Red
  Orange
  Yellow
  Green
  Blue
  Violet
  Grey
  White
}

pub fn value(colors: List(Color)) -> Result(Int, Nil) {
  let numbers =
    colors
    |> list.map(fn(color) {
      case color {
        Black -> 0
        Brown -> 1
        Red -> 2
        Orange -> 3
        Yellow -> 4
        Green -> 5
        Blue -> 6
        Violet -> 7
        Grey -> 8
        White -> 9
      }
    })
  case numbers {
    [a, b, ..] -> Ok(10 * a + b)
    _ -> Error(Nil)
  }
}
