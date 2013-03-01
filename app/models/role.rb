class Role < ActiveRecord::Base
  attr_accessible :position
  has_many :users
end
