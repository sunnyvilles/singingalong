class AddFeesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :fees, :integer
    add_column :events, :end_date, :date
  end
end
