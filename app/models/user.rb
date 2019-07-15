class User < ActiveRecord::Base
  validates_presence_of :email
  has_many :posts

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password =Password.create(new_password)
    self.password_hash = @password
  end
  
end