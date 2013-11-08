class AddSourceToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :source, :string
  end
end
