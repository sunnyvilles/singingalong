class AddYoutubeurlToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :youtubeurl, :string
  end
end
