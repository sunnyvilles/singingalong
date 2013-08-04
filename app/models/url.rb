class Url < ActiveRecord::Base
  # attr_accessible :title, :body
belongs_to :doctor
attr_accessible :title

end
