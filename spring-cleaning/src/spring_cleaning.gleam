import gleam/string

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(b) = problem
  b
}

pub fn remove_team_prefix(team: String) -> String {
  let assert Ok(#(_, b)) = string.split_once(team, " ")
  b
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let assert Ok(#(reg, team)) = string.split_once(combined, ",")
  #(reg, remove_team_prefix(team))
}
