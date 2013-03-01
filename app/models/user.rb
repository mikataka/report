class User < ActiveRecord::Base
#  attr_accessible :account, :email, :grade, :password_digest, :role_id, :studentid, :username
  attr_accessible :account, :email, :grade, :password, :role_id, :studentid, :username, :password_confirmation, :machine
  belongs_to :role
  has_many :repbodies
  has_many :myfiles
  has_many :comments, :through => :repbodies

#  has_one :repbody
  has_secure_password 
  validates_presence_of :password, :on => :create 
end
