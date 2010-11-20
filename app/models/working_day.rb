class WorkingDay < ActiveRecord::Base
  
  validates_inclusion_of :week_day, :in => 0..6
  validates_inclusion_of :start_hour, :in => 0..23
  validates_inclusion_of :start_min, :in => 0..59
  validates_inclusion_of :end_hour, :in => 0..23
  validates_inclusion_of :end_min, :in => 0..59
  
  validate :end_bigger_than_start
  
  belongs_to :workable, :polymorphic => true
  
  validates_associated :workable
  
  validates_uniqueness_of :week_day, :scope => [:workable_id, :workable_type] 
  
  private
  
  def end_bigger_than_start
    if end_hour < start_hour
      errors.add :end_hour, "can't be lower than start_hour"
    elsif end_hour == start_hour && end_min < start_min
      errors.add :end_min, "can't be lower than start_min"
    end
  end
  
end