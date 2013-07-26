class AddUploadedfileToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :uploadedfile, :string
  end
end
