class Article < ActiveRecord::Base
  
has_and_belongs_to_many :doctors
has_and_belongs_to_many :tags
attr_accessible :content, :title,:source,:type,:file_caption_0,:file_caption_1,:file_caption_2,:image_0,:image_1,:image_2,:youtubeurl,:doctors_attributes,:origin_type,:is_paid
attr_accessor :image_0,:image_1,:image_2,:origin_type
accepts_nested_attributes_for :doctors, :reject_if => lambda { |a| a[:name].blank? }
	#to search articles using name , title , content

	#scope :search_by_name, lambda {|query| where( ["name LIKE ?", "%#{query}%"] )}
	scope :search_by_title, lambda {|query| where( ["title LIKE ?", "%#{query}%"] )}
	scope :search_by_content, lambda {|query| where( ["content LIKE ?", "%#{query}%"] )}



	def self.get_recent_activity
		activity = [{
				:title => "Feed 1",
				:content => "lorem ipsum dolor"
			},{
				:title => "Feed 2",
				:content => "lorem ipsum dolor"
			},{
				:title => "Feed 3",
				:content => "lorem ipsum dolor"
			}]
		return activity
	end

	def get_image
    	#return uploadedfile || 'primary-1.jpg'
    end


	 self.inheritance_column = :_type_disabled
	#attr_protected :uploadedfile
end
