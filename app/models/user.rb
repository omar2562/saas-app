class User < ActiveRecord::Base
	has_many :login
	has_and_belongs_to_many :roles
end
