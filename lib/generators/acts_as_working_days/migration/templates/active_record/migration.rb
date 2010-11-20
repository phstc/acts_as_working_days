class ActsAsWorkingDaysMigration < ActiveRecord::Migration
  
  def self.up
    create_table :working_days, :force => true do |t|
      #Date time columns
      t.integer :week_day
      t.integer :start_hour, :default => 0
      t.integer :start_min, :default => 0
      t.integer :end_hour, :default => 23
      t.integer :end_min, :default => 59
      #Polymorphic columns
      t.integer :workable_id
      t.string :workable_type
      
      t.timestamps
    end
    add_index :working_days, [:workable_id, :workable_type]
  end
    
  def self.down
    drop_table :working_days
    remove_index :working_days, [:workable_id, :workable_type]
  end
  
end
