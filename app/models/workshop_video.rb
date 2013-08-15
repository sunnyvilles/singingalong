class WorkshopVideo < ActiveRecord::Base
belongs_to :event , foreign_key: "event_id"
attr_accessible :title
end
