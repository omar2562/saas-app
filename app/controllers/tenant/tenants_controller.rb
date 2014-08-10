class Tenant::TenantsController < ApplicationController
	def index
		@tenant = Tenant.find_by(title: params[:name])
		@tenant ||= Tenant.new
	end
end
