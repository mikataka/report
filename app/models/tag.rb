class Tag < ActiveRecord::Base
  attr_accessible :tag
  has_many :repbodies
end
