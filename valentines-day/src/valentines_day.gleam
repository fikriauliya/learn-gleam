// TODO: please define the 'Approval' custom type

// TODO: please define the 'Cuisine' custom type

// TODO: please define the 'Genre' custom type

// TODO: please define the 'Activity' custom type

pub type Approval {
  Yes
  No
  Maybe
}

pub type Cuisine {
  Korean
  Turkish
}

pub type Genre {
  Crime
  Horror
  Romance
  Thriller
}

pub type Activity {
  BoardGame
  Chill
  Movie(Genre)
  Restaurant(Cuisine)
  Walk(Int)
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    BoardGame -> No
    Chill -> No
    Movie(Romance) -> Yes
    Movie(_) -> No
    Restaurant(Korean) -> Yes
    Restaurant(Turkish) -> Maybe
    Walk(distance) if distance > 11 -> Yes
    Walk(distance) if distance > 6 -> Maybe
    Walk(_) -> No
  }
}
