// TODO: please define the Pizza custom type

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(pizza) -> pizza_price(pizza) + 1
    ExtraToppings(pizza) -> pizza_price(pizza) + 2
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case order {
    [_] -> total_price(order, 0) + 3
    [_, _] -> total_price(order, 0) + 2
    _ -> total_price(order, 0)
  }
}

fn total_price(pizzas: List(Pizza), accum: Int) -> Int {
  case pizzas {
    [] -> accum
    [p, ..res] -> total_price(res, accum + pizza_price(p))
  }
}
