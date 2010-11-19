ActiveRecord::Schema.define(:version => 0) do
  create_table :companies, :force => true do |t|
    t.string :name
  end
  create_table :working_days, :force => true do |t|
    #Date time columns
    t.integer :week_day
    t.integer :start_hour
    t.integer :start_min
    t.integer :end_hour
    t.integer :end_min
    #Polymorphic columns
    t.integer :workable_id
    t.string :workable_type
    
    t.timestamps
  end
end