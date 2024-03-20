import gleam/string

pub fn message(log_line: String) -> String {
  // let tokens = string.split(log_line, on: ":")
  // let message = list.at(tokens, 1)
  // let message = result.unwrap(message, "")
  // string.trim(message)
  case log_line {
    "[ERROR]: " <> rest | "[WARNING]: " <> rest | "[INFO]: " <> rest ->
      string.trim(rest)
    _ -> ""
  }
}

pub fn log_level(log_line: String) -> String {
  // let tokens = string.split(log_line, on: ":")
  // let level = result.unwrap(list.at(tokens, 0), "")
  // let level = string.drop_left(level, 1)
  // let level = string.drop_right(level, 1)
  case log_line {
    "[ERROR]: " <> _ -> "error"
    "[WARNING]: " <> _ -> "warning"
    "[INFO]: " <> _ -> "info"
    _ -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  let msg = message(log_line)
  let level = log_level(log_line)
  string.concat([msg, " (", level, ")"])
}
