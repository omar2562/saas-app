Rails.application.routes.draw do

	#saas-app API 
	namespace :api do
		resources :users, :tenants
		match '/login', to: 'users#login',     via: 'post'
	end
	
	#saas-app webApp	

	namespace :admin do
		resources :tenants
	end

#	get 'tenant/:name', to: 'tenant#index' 
	
	scope 'tenant/:name', module: 'tenant', as: 'tenant' do
		root 'tenants#index' 
		resources :roles
		match 'roles/:id/users', to: 'roles#users', via: 'get', as: 'users'
		match 'roles/:id/users', to: 'roles#link', via: 'post', as: 'link'
		match 'roles/:id/users/:userId', to: 'roles#unlink', via: 'get', as: 'unlink'
	end
	
	
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
