class CreateTestimonials < ActiveRecord::Migration
   def change
    create_table :testimonials do |t|
      t.string :title
 		t.integer :event_id
      t.timestamps
    end
  end
end
