require File.dirname(__FILE__) + '/test_helper'
 
class ActsAsWorkingDaysTest < Test::Unit::TestCase
  load_schema
 
  # called before every single test
  def setup
   #@nuclear_power_plant = Company.new(:name => 'Springfield Nuclear Power Plant')
   #@nuclear_power_plant.save
   Company.delete_all
  end
 
  class Company < ActiveRecord::Base
    acts_as_working_days
  end
 
  def test_schema_has_loaded_correctly
    assert_equal [], Company.all
  end
  
  # def test_put_working_day
  #   the_leftorium = Company.new(:name => 'The Leftorium')
  #   assert_equal [], the_leftorium.working_days
  #   working_day = the_leftorium.put_working_day(:week_day => 0, :start_hour => 8, :start_min => 30, :end_hour => 18, :end_min => 45)
  #   the_leftorium.save
  #   assert_equal [working_day], the_leftorium.working_days
  #   assert_equal 0, working_day.week_day
  #   assert_equal 8, working_day.start_hour
  #   assert_equal 30, working_day.start_min
  #   assert_equal 18, working_day.end_hour
  #   assert_equal 45, working_day.end_min
  # end
  
  # def test_put_updating_a_working_day
  #   moes_tavern = Company.new(:name => 'Moes Tavern')
  #   working_day = moes_tavern.put_working_day(:week_day => 0, :start_hour => 8, :start_min => 30, :end_hour => 18, :end_min => 45)
  #   moes_tavern.save
  #   #Updating working day
  #   moes_tavern.put_working_day(:week_day => 0, :start_hour => 10, :start_min => 13, :end_hour => 19, :end_min => 23)
  #   moes_tavern.save
  #   working_day = moes_tavern.working_days.first
  #   assert_equal 0, working_day.week_day
  #   assert_equal 10, working_day.start_hour
  #   assert_equal 13, working_day.start_min
  #   assert_equal 19, working_day.end_hour
  #   assert_equal 23, working_day.end_min
  # end
  
  def test_true_working_day
    moes_tavern = Company.new(:name => 'Moes Tavern')
    #moes_tavern.put_working_day(:week_day => 0, :start_hour => 8, :start_min => 30, :end_hour => 18, :end_min => 45)
    moes_tavern.working_days.build(:week_day => 0, :start_hour => 8, :start_min => 30, :end_hour => 18, :end_min => 45)
    moes_tavern.save
    assert_equal true, moes_tavern.working_day?(:week_day => 0, :hour => 12, :minute => 0)
  end
  
  # def test_uniqueness_week_day_per_model
  #   nuclear_power_plant = Company.new(:name => 'Springfield Nuclear Power Plant')
  #   working_day = nuclear_power_plant.put_working_day(:week_day => 0, :start_hour => 8, :start_min => 30, :end_hour => 18, :end_min => 45)
  #   nuclear_power_plant.put_working_day(:week_day => 0, :start_hour => 9, :start_min => 15, :end_hour => 19, :end_min => 30)
  #   nuclear_power_plant.save
  #   assert_equal [working_day], nuclear_power_plant.working_days
  #   nuclear_power_plant.put_working_day(:week_day => 0, :start_hour => 6, :start_min => 0, :end_hour => 16, :end_min => 15)
  #   nuclear_power_plant.save
  #   assert_equal [working_day], nuclear_power_plant.working_days
  # end
  
  def test_working_days_defaults
    kwik_e_mart = Company.new(:name => 'Kwik-E-Mart')
    assert_equal 7, kwik_e_mart.working_days_defaults.size
    assert_equal nil, kwik_e_mart.working_days_defaults.first.id
    #working_day = kwik_e_mart.put_working_day(:week_day => 0, :start_hour => 8, :start_min => 30, :end_hour => 18, :end_min => 45)
    working_day = kwik_e_mart.working_days.build(:week_day => 0, :start_hour => 8, :start_min => 30, :end_hour => 18, :end_min => 45)
    kwik_e_mart.save
    assert_equal working_day, kwik_e_mart.working_days_defaults.first
    7.times do | wday |
      assert_equal wday, kwik_e_mart.working_days_defaults[wday].week_day
    end
  end
   
  def test_false_working_day
    kwik_e_mart = Company.new(:name => 'Kwik-E-Mart')
    #kwik_e_mart.put_working_day(:week_day => 1, :start_hour => 8, :start_min => 30, :end_hour => 18, :end_min => 45)
    kwik_e_mart.working_days.build(:week_day => 1, :start_hour => 8, :start_min => 30, :end_hour => 18, :end_min => 45)
    kwik_e_mart.save
    assert_equal false, kwik_e_mart.working_day?(:week_day => 0, :hour => 12, :min => 0)
    assert_equal false, kwik_e_mart.working_day?(:week_day => 1, :hour => 21)
    assert_equal false, kwik_e_mart.working_day?(:week_day => 1, :hour => 7, :min => 15)
  end
   
end