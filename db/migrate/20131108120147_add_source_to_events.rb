class AddSourceToEvents < ActiveRecord::Migration
  def change
    add_column :events, :source, :string
  end
end
