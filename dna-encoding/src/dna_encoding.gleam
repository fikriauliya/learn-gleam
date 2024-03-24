import gleam/list
import gleam/bit_array
import gleam/iterator.{Done, Next}
import gleam/result

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0b00
    Cytosine -> 0b01
    Guanine -> 0b10
    Thymine -> 0b11
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0b00 -> Ok(Adenine)
    0b01 -> Ok(Cytosine)
    0b10 -> Ok(Guanine)
    0b11 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  dna
  |> list.map(encode_nucleotide)
  |> list.map(fn(i) { <<i:2>> })
  |> bit_array.concat()
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  dna
  |> iterator.unfold(fn(dna) {
    case dna {
      <<x:2, rest:bits>> -> Next(decode_nucleotide(x), rest)
      <<_:0>> -> Done
      _ -> Next(Error(Nil), <<0:0>>)
    }
  })
  |> iterator.to_list()
  |> result.all()
}
