class Article < ActiveRecord::Base
  attr_accessible :content, :name, :title
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
