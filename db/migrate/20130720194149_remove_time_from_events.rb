class RemoveTimeFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :datetime
      end

  def down
    add_column :events, :datetime, :datetime
  end
end
