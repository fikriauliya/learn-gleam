// Please define the expected_minutes_in_oven function
pub fn expected_minutes_in_oven() {
  40
}

// Please define the remaining_minutes_in_oven function
pub fn remaining_minutes_in_oven(elapsed_time: Int) {
  expected_minutes_in_oven() - elapsed_time
}

// Please define the preparation_time_in_minutes function
pub fn preparation_time_in_minutes(num_layer: Int) {
  num_layer * 2
}

// Please define the total_time_in_minutes function
pub fn total_time_in_minutes(num_layer: Int, elapsed_time: Int) -> Int {
  preparation_time_in_minutes(num_layer) + elapsed_time
}

// Please define the alarm function
pub fn alarm() {
  "Ding!"
}
