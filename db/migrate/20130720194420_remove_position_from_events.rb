class RemovePositionFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :position
      end

  def down
    add_column :events, :position, :integer
  end
end
