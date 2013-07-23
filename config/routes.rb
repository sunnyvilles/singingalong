TheOtherSongClinic::Application.routes.draw do
  
  #get "users/edit"

  #get "users/new"

  # root :to => 'users#index'

	namespace :admin do
		resources :articles
		resources :doctors
    resources :events
	end


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
	match 'articles/:id' => 'web/articles#show'


	# Static pages
	get '/clinic' => 'web/clinic#about_us'
	#do we need this one?
	get '/clinic/about-us' => 'static#clinic_about'
	get '/clinic/aim' => 'web/clinic#aim'
	get '/clinic/team' => 'web/clinic#team'
	get '/clinic/associations' => 'web/clinic#association'

	get '/clinic/knowledge-center' => 'web/clinic#knowledge_center'
	

	
	get '/academy' => 'web/academy#about_us'
	get '/academy/about-us' => 'static#academy_about'
	get '/contact-us' => 'static#contact_us'

	get '/about-us' => 'static#about_us'
  get '/about-us/:pages' => 'static#about_us'

	get '/our-edge' => 'static#our_edge'
	get '/our-edge/:pages' => 'static#our_edge'

	get '/knowledge-center' => 'static#knowledge_center'
	get '/knowledge-center/:pages' => 'static#knowledge_center'

	get '/events' => 'static#events'
  get '/events/:pages' => 'static#events'

  get '/general-information' => 'static#general_information'
  get '/general-information/:pages' => 'static#general_information'

  #get "general_information/:pages" => "static#general_information"
  #get "knowledge_center/:pages" => "static#knowledge_center"
  #get "latest_at_the_other_song/:pages" => "static#latest_at_the_other_song"
  
	# Static pages end
  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
 #namespace :admin do
	 # Directs /admin/products/* to Admin::ProductsController
	 # (app/controllers/admin/products_controller.rb)
	 #resources :products
 #end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  #match ':controller(/:action(/:id(.:format)))'

 # get "event/index"
 # get "event/new"
 # get "event/create"
 # get "event/edit"
 # get "event/show"
 # get "event/update"
 # get "event/destroy"

end
