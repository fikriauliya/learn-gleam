// Please define the TreasureChest generic custom type

// Please define the UnlockResult generic custom type

pub type TreasureChest(t) {
  TreasureChest(password: String, treasure: t)
}

pub type UnlockResult(a) {
  Unlocked(a)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest {
    TreasureChest(p, t) if p == password -> Unlocked(t)
    _ -> WrongPassword
  }
}
