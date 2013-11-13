class AddPublishToEvents < ActiveRecord::Migration
  def change
    add_column :events, :publish, :boolean,:default => false
  end
end
