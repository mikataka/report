Report::Application.routes.draw do
#  resources :updates

#  resources :comments

  resources :tags

  resources :repbodies , :only=> %w[show index opinion]

  
  resources :roles

  resources :users do
    resources :fileupload, :only => %w[index]
    resources :repbodies do #, :except => %w[new create destroy]
      resources :comments 
    end
  end
  resources :users#, :only => %w[indexyear] #, :except => %w[new create destroy update edit]

  resources :sessions 
  get "login" => "sessions#new", :as => "login" 
  get "logout" => "sessions#destroy", :as => "logout" 
  match '/mypage/:id' => 'users#mypage', :as => "mypage", :via => "get"
  match '/chpass/:id' => 'users#chpass', :as => "chpass"
  match '/userreportshow/:id' => 'users#userreportshow', :as => "userreportshow", :via => "get"
  match '/opinion/' => 'repbodies#opinion', :as => "opinion"
  match '/fileupload/' =>  'fileupload#upload'
  match '/years/' =>  'years#index'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
  root :to => 'showindex#index'
end
