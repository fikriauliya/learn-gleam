import gleam/result
import gleam/string

pub fn to_rna(dna: String) -> Result(String, Nil) {
  case dna {
    "G" <> rest | "C" <> rest | "T" <> rest | "A" <> rest -> {
      let pair = case dna {
        "G" <> _ -> Ok("C")
        "C" <> _ -> Ok("G")
        "T" <> _ -> Ok("A")
        "A" <> _ -> Ok("U")
        _ -> Error(Nil)
      }
      to_rna(rest)
      |> result.then(fn(rest) {
        pair
        |> result.map(fn(p) { string.append(p, rest) })
      })
    }
    "" -> Ok("")
    _ -> Error(Nil)
  }
}
