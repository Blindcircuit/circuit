Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    match 'users/info' => 'users/registrations#info', via: [:get, :patch]
  end
  post 'circuit/menu'
  # root 'posts#index'
  resources :posts
  post '/tinymce_assets' => 'tinymce_assets#create'
  put '/posts/:post_id/like' => 'likes#create'
  delete '/posts/:post_id/like' => 'likes#destroy'
  post '/posts/:post_id/comments' => 'comments#create'
  delete '/comments/:comment_id' => 'comments#destroy', as: 'destroy_comment'

  #web template
  root 'circuit#index'
  get 'circuit/index'
  get 'mypage/show'
  get 'user/mypage'
  get 'circuit/record'
  post 'circuit/record'
  get 'mypage/insert'
  post '/mypage' => 'mypage#create'
  get '/circuit/:track_id/:car_id' => 'circuit#record'
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
