class Admin::TenantsController < ApplicationController
	def show
		@tenant = Tenant.find_by_id(params[:id])
	end

	def index
		@tenants = Tenant.all
	end
	
	def new 
	end

	def create
		@tenant = Tenant.create(tenant_params)
		role = Role.new do |r| 
			r.name = 'Admin'
			r.tenant = @tenant
			r.users << User.find_by(name: params[:admin][:name])
		end
		role.save
		flash[:notice] = "#{@tenant.title} was successfully created."
		redirect_to admin_tenants_path
	end

	def edit
		@tenant = Tenant.find params[:id]	
	end

	def update
		@tenant = Tenant.find_by_id(params[:id])
		@tenant.update_attributes!(tenant_params)
		flash[:notice] = "#{@tenant.title} was successfully updated."
		redirect_to admin_tenant_path(@tenant)
	end

	def destroy
		@tenant = Tenant.find params[:id]	
		@tenant.destroy
		flash[:notice] = "Tenant #{@tenant.title} deleted."
		redirect_to admin_tenants_path
	end

	private
		def tenant_params
			params.require(:tenant).permit(:title,:description,:logo) if params[:tenant]
		end

end
