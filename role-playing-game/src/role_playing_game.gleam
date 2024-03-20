import gleam/option.{type Option, None, Some}
import gleam/int

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(name) -> name
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  option.map(
    player
      |> fn(player: Player) {
        case player.health {
          0 -> Some(Player(..player, health: 100))
          _ -> None
        }
      },
    fn(player: Player) {
      case player.level {
        level if level >= 10 -> Player(..player, mana: Some(100))
        _ -> Player(..player, mana: None)
      }
    },
  )
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(mana) if mana >= cost -> #(
      Player(..player, mana: Some(mana - cost)),
      cost * 2,
    )
    Some(_) -> #(player, 0)
    _ -> #(Player(..player, health: int.max(0, player.health - cost)), 0)
  }
}
