class Otherdescevents < ActiveRecord::Migration
  def change
  	change_column :events, :sub_title, :text
  	rename_column :events, :sub_title, :other_description
  end
end
