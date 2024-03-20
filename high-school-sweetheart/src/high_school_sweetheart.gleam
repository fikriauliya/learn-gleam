import gleam/string
import gleam/result
import gleam/option
import gleam/list

pub fn first_letter(name: String) {
  name
  |> string.trim()
  |> string.first()
  |> result.unwrap("")
}

pub fn initial(name: String) {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) {
  full_name
  |> string.split_once(" ")
  |> fn(tokens) {
    case tokens {
      Ok(#(a, b)) -> {
        string.concat([initial(a), " ", initial(b)])
      }
      _ -> ""
    }
  }
}

pub fn pair(full_name1: String, full_name2: String) {
  string.concat([
    "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     ",
    initials(full_name1),
    "  +  ",
    initials(full_name2),
    "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
",
  ])
}
