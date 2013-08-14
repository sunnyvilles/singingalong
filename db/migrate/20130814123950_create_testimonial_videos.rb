class CreateTestimonialVideos < ActiveRecord::Migration
 def change
    create_table :testimonial_videos do |t|
      t.string :title
 		t.integer :event_id
      t.timestamps
    end
  end
end
