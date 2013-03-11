class Hyperlink < ActiveRecord::Base
  attr_accessible :link, :repbody_id
  belongs_to :repbody
end
