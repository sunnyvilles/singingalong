class Changepaiddefault < ActiveRecord::Migration
  def change
  	change_column :articles, :is_paid, :boolean, :default => false
  end
end
