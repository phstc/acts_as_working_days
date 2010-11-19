require File.dirname(__FILE__) + '/test_helper'
 
class WorkingDayTest < Test::Unit::TestCase
  load_schema
 
  def test_working_day
    assert_kind_of WorkingDay, WorkingDay.new
  end
end