# require 'bcrypt'

class User < ActiveRecord::Base
	has_secure_password
	# attr_accessor :password, :password_confirmation
	# before_create :encrypt_password

	validates_presence_of :email
	validates_uniqueness_of :email
	# validates_confirmation_of :password

	# def encrypt_password
	# 	self.password_salt = BCrypt::Engine.generate_salt
	# 	self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	# end

	# def self.authenticate(email, password)
	# 	user = User.find_by_email(email)
	# 	if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)	
	# 		user
	# 	else
	# 		nil
	# 	end
	# end
end
