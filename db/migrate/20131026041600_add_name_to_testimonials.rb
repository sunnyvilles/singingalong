class AddNameToTestimonials < ActiveRecord::Migration
  def change
  	
    add_column :testimonials, :testimonial_video, :string
    add_column :testimonials, :testimonial_by, :string
    add_column :testimonials, :description, :text
    remove_column :testimonials, :event_id
    
  end
end
