class Doctor < ActiveRecord::Base
  
	has_and_belongs_to_many :articles
	has_many :urls
	attr_accessible :name, :title, :description

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
			"9" => "Visiting"
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
		}
		people.each{|person|
			if(!peopleHash[person[:title]].present?)
				peopleHash[person[:title]] = []
			end
			peopleHash[person[:title]] << person
		}
		return peopleHash
	end
end
