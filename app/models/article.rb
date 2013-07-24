class Article < ActiveRecord::Base
  
has_and_belongs_to_many :doctors
  attr_accessible :content, :name, :title


	#to search articles using name , title , content

	scope :search_by_name, lambda {|query| where( ["name LIKE ?", "%#{query}%"] )}
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
end
