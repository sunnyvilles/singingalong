class Increasedocdescrange < ActiveRecord::Migration
  def up
    change_column :doctors, :description, :text
end
def down
    change_column :doctors, :description, :string
end
end
