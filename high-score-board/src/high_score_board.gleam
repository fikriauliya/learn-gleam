import gleam/dict.{type Dict}
import gleam/option.{None, Some}

pub type ScoreBoard =
  Dict(String, Int)

pub fn create_score_board() -> ScoreBoard {
  dict.from_list([#("The Best Ever", 1_000_000)])
}

pub fn add_player(
  score_board: ScoreBoard,
  player: String,
  score: Int,
) -> ScoreBoard {
  score_board
  |> dict.insert(player, score)
}

pub fn remove_player(score_board: ScoreBoard, player: String) -> ScoreBoard {
  score_board
  |> dict.delete(player)
}

pub fn update_score(
  score_board: ScoreBoard,
  player: String,
  points: Int,
) -> ScoreBoard {
  case dict.has_key(score_board, player) {
    True ->
      score_board
      |> dict.update(update: player, with: fn(score) {
        case score {
          Some(score) -> score + points
          None -> 0
        }
      })
    False -> score_board
  }
}

pub fn apply_monday_bonus(score_board: ScoreBoard) -> ScoreBoard {
  score_board
  |> dict.map_values(fn(_, val) { val + 100 })
}
