class User < ActiveRecord::Base
  has_secure_password

  validates :name, :alias,  :presence => true
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => true

end
