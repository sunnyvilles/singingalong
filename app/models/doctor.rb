class Doctor < ActiveRecord::Base
  
has_and_belongs_to_many :articles
has_many :urls
  attr_accessible :name

  scope :named, lambda {|the_name| where(:name => the_name)}
end
