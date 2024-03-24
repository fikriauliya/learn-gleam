import gleam/set.{type Set}
import gleam/list
import gleam/string
import gleam/result

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let final_collection =
    collection
    |> set.delete(my_card)
    |> set.insert(their_card)
  case
    #(set.contains(collection, my_card), set.contains(collection, their_card))
  {
    #(False, _) -> #(False, final_collection)
    //we don't have
    #(_, True) -> #(False, final_collection)
    //we already has
    _ -> #(True, final_collection)
  }
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
  |> list.reduce(fn(b, a) { set.intersection(b, a) })
  |> result.unwrap(set.from_list([]))
  |> set.to_list()
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.fold(set.new(), fn(b, a) { set.union(b, a) })
  |> set.size
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(string.starts_with(_, "Shiny "))
}
