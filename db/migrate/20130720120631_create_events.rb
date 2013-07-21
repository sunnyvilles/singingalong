class CreateEvents < ActiveRecord::Migration
  # PROBLEM:the following 'datetime' column name is created as 'time' in the local table on running 
  # migrations though its same (ie datetime) in the heroku servers . in migration 20130720194149_remove_time_from_events
  # this column has been removed completely.
  # change the text in the 'remove_time_from_events' migration file and rename datetime as 
  #                 when running migration for local: time
  #                 when running migration for heroku: datetime 
  # DO NOT CHANGE ANYTHING HERE JUST ONLY IN THE "remove_time_from_events" TABLE

  def change
    create_table :events do |t|
      t.integer :position
      t.string :title
      t.string :sub_title
      t.text :description
      t.datetime :datetime
    
    end
  end




end
