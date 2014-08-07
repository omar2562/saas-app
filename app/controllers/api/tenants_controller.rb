class Api::TenantsController < ApplicationController
	before_filter :restrict_access
	respond_to :json, :xml

	def index
		@tenants = Tenant.all
		respond_with @tenants
	end

	def create
		@tenant = Tenant.create(tenant_params)
		respond_to do |format|
			format.xml {render xml: @tenant}
			format.json {render json: @tenant}
		end
	end

	def show
		@tenant = Tenant.find_by_id(params[:id])
		respond_with @tenant
	end

	def update
		@tenant = Tenant.find_by_id(params[:id])		
		@tenant.update(tenant_params)
		respond_with @tenant
	end

	def destroy
		@tenant = Tenant.find_by_id(params[:id])		
		@tenant.destroy
		respond_with @tenant
	end

	private
		def restrict_access
			api_key = Login.find_by(token: params[:token], updated_at: (Time.now - 10.minute)..Time.now )
			head :unauthorized unless api_key
			api_key.save if api_key
		end

		def tenant_params
			params.require(:tenant).permit(:title,:description,:logo) if params[:tenant]
		end

end
