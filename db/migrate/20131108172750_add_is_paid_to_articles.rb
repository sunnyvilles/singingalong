class AddIsPaidToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :is_paid, :boolean
  end
end
