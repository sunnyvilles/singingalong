class CreateDoctorsArticlesJoin < ActiveRecord::Migration
  def up
  	create_table :articles_doctors, :id => false do |t|
  		t.integer "doctor_id"
  		t.integer "article_id"

  	end
  	add_index :articles_doctors , ["doctor_id" , "article_id"]

  end

  def down

  	drop_table :articles_doctors
  end
end
