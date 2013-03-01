class Comment < ActiveRecord::Base
  attr_accessible :body, :date, :user_id, :repbody_id
  belongs_to :repbody
  belongs_to :user
end
