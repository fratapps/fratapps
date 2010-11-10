Fratapps::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :tasks
  
  
  match '/about', :to => 'about#index'
  match '/contact', :to => 'contact#index'
  match '/help', :to => 'help#index'
  match '/tour', :to => 'tour#index'
  match '/users', :to => 'users#index'
  match '/groups', :to => 'groups#index'
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/dashboard', :to => 'dashboard#index'
  match '/dashboard/admin', :to => 'dashboard#index'
  match '/dashboard/user', :to => 'dashboard#index'
  match '/dashboard/submit_for_approval', :to => 'dashboard#submit_for_approval'
  match '/dashboard/take', :to => 'dashboard#take'
  match '/tasks/new', :to => 'tasks#new'
  match '/tasks/finished/:id', :to => 'tasks#finished'
  match '/tasks/unfinished/:id', :to => 'tasks#unfinished'
  match '/dashboard/leaderboard', :to => 'dashboard#leaderboard'
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

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
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
 	root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end


