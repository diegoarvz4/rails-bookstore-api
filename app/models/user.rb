class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_secure_password
  validates_presence_of :username, :email, :password_digest

  has_many :books

end
