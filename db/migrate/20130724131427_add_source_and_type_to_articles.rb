class AddSourceAndTypeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :source, :string
    add_column :articles, :type, :string
  end
end
