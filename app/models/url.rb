class Url < ActiveRecord::Base
  # attr_accessible :title, :body
belongs_to :admin_doctor , foreign_key: "admin_doctor_id"
attr_accessible :title

end
