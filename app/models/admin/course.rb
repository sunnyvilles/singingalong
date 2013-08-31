class Admin::Course < ActiveRecord::Base
  attr_accessible :course_type, :description, :discounts, :end_date, :fees, :start_date, :timing,:course_pdf, :title, :venue,:email,:curriculam,:phone_no,:batch
	attr_accessor :course_pdf
end
