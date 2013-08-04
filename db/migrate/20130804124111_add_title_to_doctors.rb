class AddTitleToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :title, :string
    add_column :doctors, :designation, :string
    add_column :doctors, :description, :string
  end
end
