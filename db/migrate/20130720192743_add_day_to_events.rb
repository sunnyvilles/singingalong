class AddDayToEvents < ActiveRecord::Migration
  def change
    add_column :events, :day, :date
  end
end
