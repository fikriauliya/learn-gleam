import gleam/string
import gleam/list

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  case #(string.length(input), size) {
    #(s_length, _) if s_length == 0 -> Error(EmptySeries)
    #(s_length, size) if size > s_length -> Error(SliceLengthTooLarge)
    #(_, size) if size == 0 -> Error(SliceLengthZero)
    #(_, size) if size < 0 -> Error(SliceLengthNegative)
    _ -> {
      string.to_graphemes(input)
      |> list.window(size)
      |> list.map(string.concat(_))
      |> Ok
      // let cur_slice =
      //   list.take(chars, size)
      //   |> string.concat

      // let rem = string.drop_left(input, 1)
      // let rem_slice = slices(rem, size)

      // case rem_slice {
      //   Error(_) -> Ok([cur_slice])
      //   Ok(rem) -> Ok(list.prepend(rem, cur_slice))
      // }
    }
  }
}

pub type Error {
  SliceLengthTooLarge
  SliceLengthNegative
  SliceLengthZero
  EmptySeries
}
