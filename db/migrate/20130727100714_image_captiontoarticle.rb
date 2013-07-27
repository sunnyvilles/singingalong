class ImageCaptiontoarticle < ActiveRecord::Migration
  def change
  	rename_column :articles, :uploadedfile, :file_caption_0
  	add_column :articles, :file_caption_1, :string
  	add_column :articles, :file_caption_2, :string
  end

end
