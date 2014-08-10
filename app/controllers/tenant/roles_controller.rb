class Tenant::RolesController < ApplicationController
	
	def index
		@roles = Tenant.find_by(title: params[:name]).roles
	end	
	
	def new 
	end
	
	def create
		@role = Role.new do |r| 
			r.name = params[:role][:name]
			r.tenant = Tenant.find_by(title: params[:name])
		end
		@role.save
		flash[:notice] = "#{@role.name} was successfully created."
		redirect_to tenant_roles_path
	end
	
	def show
		@role = Role.find_by_id(params[:id])
	end
	
	def edit
		@role = Role.find params[:id]	
	end

	def update
		@role = Role.find_by_id(params[:id])
		@role.name = params[:role][:name]
		@role.save!
		flash[:notice] = "#{@role.name} was successfully updated."
		redirect_to tenant_role_path(params[:name], @role)
	end
	
end
