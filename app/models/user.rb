class User < ApplicationRecord
	before_save { self.email = email.downcase }
	before_save { self.name = name.downcase }
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :email, presence: true
	has_secure_password
end
