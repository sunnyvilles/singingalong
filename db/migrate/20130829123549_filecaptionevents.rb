class Filecaptionevents < ActiveRecord::Migration
  def change
    add_column :events, :caption_0, :string
    add_column :events, :caption_1, :string
    add_column :events, :caption_2, :string
  end

end
