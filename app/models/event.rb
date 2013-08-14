class Event < ActiveRecord::Base
  

	has_many :workshop_videos
	has_many :testimonial_videos
	has_many :testimonials
  # attr_accessible :title, :body
  attr_accessible :title, :sub_title, :day, :description
end
