class Tenant < ActiveRecord::Base
	has_many :roles
end
