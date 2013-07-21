class Event < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :sub_title, :day, :description
end
