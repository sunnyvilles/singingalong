class RemoveTimeFromEvents < ActiveRecord::Migration
 # NOTE: change column name to 'time' if running for local and change 
 # it back to 'datetime' when running on heroku
 
  def up
    remove_column :events, :time
      end

  def down
    add_column :events, :time, :datetime
  end
end