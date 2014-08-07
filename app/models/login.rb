class Login < ActiveRecord::Base
	belongs_to :user
	before_create :generate_token
 	validate :token
 
  private
    def generate_token
      begin
        self.token = SecureRandom.hex
      end while self.class.exists?(token: token)
    end
end
