class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :position
      t.string :title
      t.string :sub_title
      t.text :description
      t.datetime :datetime
    
    end
  end




end
