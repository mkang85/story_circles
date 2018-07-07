class User < ActiveRecord::Base
  has_many :circles
  has_secure_password

  def slug
  username.downcase.split(" ").join("-")
end

def self.find_by_slug(slug)
  User.all.find{|user| user.slug == slug}
end

end
