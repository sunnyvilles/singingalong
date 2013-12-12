class Doctor < ActiveRecord::Base
  
	has_and_belongs_to_many :articles
	has_many :urls

	# before_save :add_url_protocol

	attr_accessible :name, :title, :description, :picture
	attr_accessor :picture
	scope :named, lambda {|the_name| where(:name => the_name)}
	@titles = [["",0],["Consultant / Faculty", 1],
	["Sr. Resident Doctors", 2],
	["Resident Doctors", 3],
	["Curriculum", 4],
	["General Manager (Operations)", 5],
	["Assistant general manager (Administration)", 6],
	["Academic & Support team", 7],
	["Accreditation and Resources", 8],
	["Publication", 9],
	["Clinical & Support team", 10],
	["VISITING FACULTY / VISITING CONSULTANT", 11],
	#["General Manager (Administration)", 12],
	["PR clinic & Events Co-ordinator", 13],
	["International Support Team", 14],
	["Management", 15]
	]
	def self.titles
		{			
			"1" => "Consultant / Faculty",
			"2" => "Sr. Resident Doctors",
			"3" => "Resident Doctors",
			"4" => "Curriculum",
			"5" => "General Manager (Operations)",			
			"6" => "Assistant general manager (Administration)",
			"7" => "Academic & Support team",
			"8" => "Accreditation and Resources",
			"9" => "Publication",
			"10" => "Clinical & Support team",
			"11" => "VISITING FACULTY / VISITING CONSULTANT",
			#"12" => "General Manager (Administration)",
			"13" => "PR clinic & Events Co-ordinator",
			"14" => "International Support Team",
			"15" => "Management"
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
			"10" => [],
			"11" => [],
			#"12" => [],
			"13" => [],
			"14" => [],
		}
		people.each{|person|
			if(person[:title].to_s != "0" and person[:title].present? && !peopleHash[person[:title]].present?)
				peopleHash[person[:title]] = []				
			end
			
			if person[:title].to_s == "0" or person[:title].to_s == "General Manager (Administration)"				
			else
				if peopleHash[person[:title]] != nil
					peopleHash[person[:title]] << person
				end
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
