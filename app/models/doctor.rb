class Doctor < ActiveRecord::Base
  
	has_and_belongs_to_many :articles
	has_many :urls

	# before_save :add_url_protocol

	attr_accessible :name, :title, :description, :picture
	attr_accessor :picture
	scope :named, lambda {|the_name| where(:name => the_name)}
	def self.titles
		{
			"1" => "Consultancy/ Faculty",
			"2" => "Sr. Resident Doctors",
			"3" => "Resident Doctors",
			"4" => "Curriculum",
			"5" => "Marketing and PR (Academy)",
			"6" => "Accreditation and Resources",
			"7" => "Publication",
			"8" => "Marketing and PR (Clinic)",
			"9" => "Visiting",
			"10" => "General Manager (Administration)"
		}
	end
	def self.get_people
		people = Doctor.all
		peopleHash = {
			"1" => [],
			"2" => [],
			"3" => [],
			"4" => [],
			"5" => [],
			"6" => [],
			"7" => [],
			"8" => [],
			"9" => [],
			"10" => []
		}
		people.each{|person|
			if(person[:title].present? && !peopleHash[person[:title]].present?)
				peopleHash[person[:title]] = []
				peopleHash[person[:title]] << person
			end			
		}
		return peopleHash
	end

	 def add_url_protocol
    	if self.url && !(self.url[/^http:\/\//] || self.url[/^https:\/\//])
      self.url = 'http://' + self.url
    	end
  	end
end
