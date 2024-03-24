import gleam/iterator.{type Iterator}

pub type Item {
  Item(name: String, price: Int, quantity: Int)
}

pub fn item_names(items: Iterator(Item)) -> Iterator(String) {
  items
  |> iterator.map(fn(it) { it.name })
}

pub fn cheap(items: Iterator(Item)) -> Iterator(Item) {
  items
  |> iterator.filter(fn(it) { it.price < 30 })
}

pub fn out_of_stock(items: Iterator(Item)) -> Iterator(Item) {
  items
  |> iterator.filter(fn(it) { it.quantity == 0 })
}

pub fn total_stock(items: Iterator(Item)) -> Int {
  items
  |> iterator.fold(0, fn(b, a) { b + a.quantity })
}
