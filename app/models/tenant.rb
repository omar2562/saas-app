class Tenant < ActiveRecord::Base
	has_many :role
end
