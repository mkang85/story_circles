class User < ActiveRecord::Base
  has_many :circles
  has_secure_password
end
