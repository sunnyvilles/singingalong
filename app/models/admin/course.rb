class Admin::Course < ActiveRecord::Base
  attr_accessible :course_type, :description, :discounts, :end_date, :fees, :start_date, :timing, :title, :venue
end
