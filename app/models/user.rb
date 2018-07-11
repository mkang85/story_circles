class User < ActiveRecord::Base
  has_secure_password
  has_many :circles

  def slug
  username.downcase.split(" ").join("-")
end

def self.find_by_slug(slug)
  User.all.find{|user| user.slug == slug}
end

end
