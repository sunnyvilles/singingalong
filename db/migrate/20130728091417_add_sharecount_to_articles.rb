class AddSharecountToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :sharecount, :integer
  end
end
