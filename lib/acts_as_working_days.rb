module ActsAsWorkingDays
  def self.included(base)
    base.send :extend, ClassMethods
  end
 
  module ClassMethods
    # any method placed here will apply to classes, like Hickwall
    def acts_as_working_days
      # adding relationship to self class
      has_many :working_days, :as => :workable
      send :include, InstanceMethods
    end
  end
 
  module InstanceMethods
    def working_day?(params ={:week_day => Time.now.wday, :hour => Time.now.hour, :min => Time.now.min })
      result = working_days.where("week_day = :week_day AND ((start_hour < :hour) OR (start_hour = :hour AND start_min <= :min)) AND ((end_hour > :hour) OR (end_hour = :hour AND end_min <= :min))", 
        {
          :week_day => params[:week_day], 
          :hour => params[:hour], 
          :min => params[:min]
        })
      !result.empty?
    end
    
    def put_working_day(params = {:week_day => Time.now.wday, :start_hour => 0, :start_min => 0, :end_hour => 23, :end_min => 59})
      working_day = nil
      working_days.each do | wd |
        if wd.week_day == params[:week_day]
          working_day = wd
          break
        end
      end
      if working_day.nil?
        working_days.build(params)
      else
        working_day.update_attributes(params)
      end
    end
  end
end

ActiveRecord::Base.send :include, ActsAsWorkingDays