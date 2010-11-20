require File.dirname(__FILE__) + '/test_helper'
 
class WorkingDayTest < Test::Unit::TestCase
  load_schema
 
  def test_working_day
    assert_kind_of WorkingDay, WorkingDay.new
  end
  
  def test_end_hour_lower_than_start_hour
    working_day = WorkingDay.new(:week_day => 0, :start_hour => 8, :start_min => 30, :end_hour => 7, :end_min => 45)
    assert !working_day.valid?
    working_day.end_hour = 10
    assert working_day.valid?
  end
  
  def test_end_min_lower_than_start_min
    working_day = WorkingDay.new(:week_day => 0, :start_hour => 8, :start_min => 30, :end_hour => 8, :end_min => 15)
    assert !working_day.valid?
    working_day.end_min = 45
    assert working_day.valid?
  end
  
end