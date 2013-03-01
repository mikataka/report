class Update < ActiveRecord::Base
  attr_accessible :comment, :date, :repbody_id
  belongs_to :repbody
end
