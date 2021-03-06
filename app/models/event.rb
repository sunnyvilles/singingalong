class Event < ActiveRecord::Base
  

	has_many :workshop_videos
	has_many :testimonial_videos
  # attr_accessible :title, :body
  attr_accessible :title, :other_description, :day,:end_date, :description,:fees, :testimonial_videos_attributes,:workshop_videos_attributes,:testimonials_attributes,:image_0,:image_1,:image_2,:event_type,:caption_0, :caption_1, :caption_2,:publish,:event_pdf
  attr_accessor :image_0,:image_1,:image_2,:event_pdf
  #accepts_nested_attributes_for :testimonials, :allow_destroy => true, :reject_if => lambda { |a| a[:title].blank? }
  accepts_nested_attributes_for :testimonial_videos, :allow_destroy => true, :reject_if => lambda { |a| a[:title].blank? }
  accepts_nested_attributes_for :workshop_videos, :allow_destroy => true, :reject_if => lambda { |a| a[:title].blank? }


  validates :day, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true

end
