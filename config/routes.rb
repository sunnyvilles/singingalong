TheOtherSongClinic::Application.routes.draw do



  #get "users/edit"

  #get "users/new"

  # root :to => 'users#index'

	namespace :admin do
		scope '/academy' do
			resources :articles,:doctors, :events, :courses
			get '/videos' => 'articles#index'
			get '/videos/new' => 'articles#new'
			get '/videos/:id/edit' =>'articles#edit'
			get '/case-studies' => 'articles#index'
			get '/case-studies/new' => 'articles#new'
			get '/case-studies/:id/edit' =>'articles#edit'
		end
		scope '/clinic' do
			resources :articles, :doctors, :events, :courses
			get '/videos' => 'articles#index'
			get '/videos/new' => 'articles#new'
			get '/videos/:id/edit' =>'articles#edit'
			get '/case-studies' => 'articles#index'
			get '/case-studies/new' => 'articles#new'
			get '/case-studies/:id/edit' =>'articles#edit'
			

		end
	end
	#resources :articles, only: [:show, :index]
	#resources :doctors, only: [:show, :index]

	get '/admin' => 'admin/admin#show'
	
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  # match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
	#match 'articles/:id' => 'web/articles#show'


	# Static pages
	get '/clinic' => 'web/clinic#about'
	#do we need this one?
	get '/clinic/about-us' => 'static#clinic_about'
	get '/clinic/aim' => 'web/clinic#aim'
	get '/clinic/team' => 'web/clinic#team'
	get '/clinic/associations' => 'web/clinic#association'
	get '/clinic/associations/wish' => 'web/clinic#association_wish'
	
	#knowledge center
	get '/clinic/articles' => 'web/clinic#articles'
	get '/clinic/articles/:article_id' => 'web/clinic#article'

	get '/clinic/case-studies' => 'web/clinic#case_studies'
	get '/clinic/case-studies/:article_id' => 'web/clinic#case_study'

	get '/clinic/videos' => 'web/clinic#videos'
	get '/clinic/videos/:article_id' => 'web/clinic#video'

	get '/clinic/about-homeopathy' => 'web/clinic#about_homeopathy'

	#Edge
	get '/clinic/belief' => 'web/clinic#belief'
	get '/clinic/our-approach' => 'web/clinic#our_approach'
	get '/clinic/complimentry-therapies' => 'web/clinic#complimentry_therapies'
	get '/clinic/speciality-clinic' => 'web/clinic#speciality_clinic'
	get '/clinic/testimonials' => 'web/clinic#testimonials'
	get '/clinic/general-information' => 'web/clinic#general_information'
	get '/clinic/events' => 'web/clinic#events'
	get '/clinic/contact-us' => 'web/clinic#contact'
	#Clinic routes end

	#Academy routes start
	get '/academy' => 'web/academy#about_us'
	get '/academy/aim' => 'web/academy#aim'
	get '/academy/team' => 'web/academy#team'
	get '/academy/associations' => 'web/academy#association'
	
	
	get '/academy/articles' => 'web/academy#articles'
	get '/academy/articles/:article_id' => 'web/academy#article'

	get '/academy/case-studies' => 'web/academy#case_studies'
	get '/academy/case-studies/:article_id' => 'web/academy#case_study'

	get '/academy/videos' => 'web/academy#videos'
	get '/academy/videos/:article_id' => 'web/academy#video'
	
	#Edge
	get '/academy/our-approach' => 'web/academy#our_approach'
	get '/academy/learning-model' => 'web/academy#learning_model'
	get '/academy/teaching-tools' => 'web/academy#teaching_tools'
	get '/academy/facilities' => 'web/academy#facilities'
	
	#courses
	get '/academy/courses' => 'web/academy#courses'
	get '/academy/indian_courses' => 'web/academy#indian_courses'
	get '/academy/international_courses' => 'web/academy#international_courses'
	get '/academy/customized_courses' => 'web/academy#customized_courses'

	get '/academy/satellite' => 'web/academy#satellite'
	get '/academy/admissions' => 'web/academy#admissions'

	get '/academy/contact-us' => 'web/academy#contact'
	#get '/events' => 'static#events'
  #get '/events/:pages' => 'static#events'

  #get '/general-information' => 'static#general_information'
  #get '/general-information/:pages' => 'static#general_information'

  get '/social-sharing/:article_id' => 'web/clinic#social_sharing'
  
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
