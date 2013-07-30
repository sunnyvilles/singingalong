class Changedefaultstoviewshare < ActiveRecord::Migration
  def change
  	change_column :articles, :viewcount, :integer, :default => 0
  	change_column :articles, :sharecount, :integer, :default => 0
  end

end
