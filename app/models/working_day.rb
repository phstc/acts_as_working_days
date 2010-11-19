class WorkingDay < ActiveRecord::Base
  
  validates_inclusion_of :week_day, :in => 0..6
  validates_inclusion_of :start_hour, :in => 0..23
  validates_inclusion_of :start_min, :in => 0..59
  validates_inclusion_of :end_hour, :in => 0..23
  validates_inclusion_of :end_min, :in => 0..59
  
  belongs_to :workable, :polymorphic => true
  
  validates_associated :workable
  
  validates_uniqueness_of :week_day, :scope => [:workable_id, :workable_type] 
  
end