class Myfile < ActiveRecord::Base
  attr_accessible :caption, :filename, :user_id
  belongs_to :user
end
