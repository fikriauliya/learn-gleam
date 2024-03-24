import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  let new_game =
    game
    |> rule1
    |> result.map(rule2)
    |> result.try(rule3)
    |> result.try(rule4)

  case new_game {
    Ok(res) ->
      case res.player {
        Black -> Game(..res, player: White)
        White -> Game(..res, player: Black)
      }
    Error(err) -> Game(..game, error: err)
  }
}