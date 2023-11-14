Rails.application.routes.draw do
  #resources :schedules

  root :to => redirect('/login')
  #root "schedules#index"
  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"

  get "/sign_up", to: "students#new"
  post "/sign_up", to: "students#create", as: "students"

  get "/logout", to: "sessions#logout"
  
  get "/profile", to: "students#profile", as: "profile"
  get "/edit_profile", to: "students#edit_profile", as: "edit_profile"
  put "/edit_profile", to: "students#edit_profile", as: "edited_profile"

  get "/schedule", to: "schedules#index", as: "schedule"
  delete "/schedule", to: "schedules#destroy", as: "destroy_schedule"

  get "/add_course/:semester", to: "schedules#add_course", as: "add_course"
  post "/add_course/:semester", to: "schedules#create", as: "create_schedule"
  #get '/courses', to: "courses#index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

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
