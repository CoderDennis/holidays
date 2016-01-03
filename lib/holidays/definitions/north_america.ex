defmodule Holidays.Definitions.NorthAmerica do
  use Holidays.Define

  holiday "Groundhog Day",
    %{month: 2,
      regions: [:us, :ca],
      day: 2,
      type: :informal}

  holiday "Valentine's Day",
    %{month: 2,
      regions: [:us, :ca],
      day: 14,
      type: :informal}

  holiday "St. Patrick's Day",
    %{month: 3,
      regions: [:us, :ca],
      day: 17,
      type: :informal}

  holiday "April Fool's Day",
    %{month: 4,
      regions: [:us, :ca],
      day: 1,
      type: :informal}

  holiday "Earth Day",
    %{month: 4,
      regions: [:us, :ca],
      day: 22,
      type: :informal}

#   5: 
#   - name: Mother's Day
#     week: 2
#     regions: [us, ca]
#     wday: 0
#     type: :informal
#   - name: Armed Forces Day
#     week: 3
#     regions: [us]
#     wday: 6
#     type: :informal
#   6:
#   - name: Father's Day
#     week: 3
#     regions: [us, ca]
#     wday: 0
#     type: :informal
#   10: 
#   - name: Halloween
#     regions: [us, ca]
#     mday: 31
#     type: :informal


# tests: |
#     {Date.civil(2013,2,2) => 'Groundhog Day',
#      Date.civil(2013,2,14) => 'Valentine\'s Day',
#      Date.civil(2013,3,17) => 'St. Patrick\'s Day',
#      Date.civil(2013,4,1) => 'April Fool\'s Day',
#      Date.civil(2013,4,22) => 'Earth Day',
#      Date.civil(2013,5,12) => 'Mother\'s Day',
#      Date.civil(2013,5,18) => 'Armed Forces Day',
#      Date.civil(2013,6,16) => 'Father\'s Day',
#      Date.civil(2013,10,31) => 'Halloween'}.each do |date, name|
#       assert_equal name, (Holidays.on(date, :us, :informal)[0] || {})[:name]
#     end

end
