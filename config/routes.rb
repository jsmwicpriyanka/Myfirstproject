Rails.application.routes.draw do

  resources :tests

  devise_for :users

  root to: 'home#index'

  resources :profiles

  resources :posts do
    resources :comments
  end

 
  resources :friendables do 
    member do 
      post 'friend_request' 
    end 
  end
  get '/send_request/:id', to: 'friendables#friend_request', :as => 'send_request'
  get '/accept_request/:id', to: 'friendables#friend_request_accept', :as => 'accept_request'
  get '/reject_request/:id', to: 'friendables#friend_request_reject', :as => 'reject_request'
  get '/friendables/friend', to: 'friendables#show', :as => 'friend'
 

  resources :likes
  get 'comment/:comment_id/like', to: 'likes#comment_like', :as => 'comment_like'
  get 'post/:post_id/like', to: 'likes#post_like', :as => 'post_like'
  delete '/likes/:id', to: 'likes#destroy', :as => 'destroy'
    

  resources :messages, :only => [:index, :new, :create]
  get 'message/inbox', to: 'messages#inbox' , :as => 'recieve_message'
  get 'message/sentbox', to: 'messages#sentbox' , :as => 'sent_message'
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
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
