class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	validates :name, presence: true, length: {maximum: 50}
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

	# can be respond_to :password, :password_confirmation, :password_digest
	has_secure_password
	validates :password, length: {minimum: 6}

	# downcase the email before save to the database
	before_save {
		self.email = email.downcase
	}
end
