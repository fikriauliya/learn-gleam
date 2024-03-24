import gleam/order.{type Order}
import gleam/float
import gleam/list

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

fn to_celcius(t: Temperature) -> Float {
  case t {
    Celsius(c) -> c
    Fahrenheit(f) -> fahrenheit_to_celsius(f)
  }
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  float.compare(to_celcius(left), to_celcius(right))
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, fn(c1, c2) {
    compare_temperature(c1.temperature, c2.temperature)
  })
}
