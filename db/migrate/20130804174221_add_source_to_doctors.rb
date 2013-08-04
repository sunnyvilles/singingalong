class AddSourceToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :source, :string
  end
end
