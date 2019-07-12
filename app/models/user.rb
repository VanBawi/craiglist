class User < ActiveRecord::Base
  validates_presence_of :email
  has_many :posts

  include BCrypt

<<<<<<< HEAD
=======

>>>>>>> 4bcb87d8a6bd55f7d07a407743cc550c3848138e
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password =Password.create(new_password)
    self.password_hash = @password
  end
  
end