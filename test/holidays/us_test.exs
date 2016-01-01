defmodule Holidays.UsTest do
  use ExUnit.Case

  alias Holidays.TestHelper

  test "New Year's Day" do
    TestHelper.date_has_holiday_in_region({2008,1,1},
                                          "New Year's Day",
                                          :us)
  end

  test "Martin Luther King, Jr. Day" do
    TestHelper.date_has_holiday_in_region({2008,1,21},
                                          "Martin Luther King, Jr. Day",
                                          :us)
  end

# Date.civil(2008,2,18) => 'Presidents\' Day',
# Date.civil(2008,5,26) => 'Memorial Day',
# Date.civil(2008,7,4) => 'Independence Day',
# Date.civil(2008,9,1) => 'Labor Day',
# Date.civil(2008,10,13) => 'Columbus Day',
# Date.civil(2008,11,11) => 'Veterans Day',
# Date.civil(2008,11,27) => 'Thanksgiving',
# Date.civil(2013,11,28) => 'Thanksgiving',
# Date.civil(2008,12,25) => 'Christmas Day'}.each do |date, name|
#  assert_equal name, (Holidays.on(date, :us)[0] || {})[:name]
# end
# {Date.civil(2008, 3, 31) => 'Cesar Chavez Day',
# Date.civil(2008, 11, 28) => 'Day after Thanksgiving',
# Date.civil(2013, 11, 29) => 'Day after Thanksgiving'}.each do |date, name|
#  assert_equal name, (Holidays.on(date, :us, :us_ca)[0] || {})[:name]
# end

end
