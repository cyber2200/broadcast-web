BroadcastWeb::Application.routes.draw do
  get 'transcoder_console', controller: :TranscoderConsole, action: :index
  post 'transcoder_console/perform'

  get 'transcoder_test', controller: :TranscoderTest, action: :index
  post 'transcoder_test/perform'
  get 'transcoder_test/status'
  get 'transcoder_test/host',controller: :TranscoderTest, action: :change_transcoder

  namespace :admin do

    resources :captures
    resources :sources
    resources :presets
    resources :schemes
    resources :transcoders do
      member do
        get :action
        get :create_slot
        get :start_slot
        get :stop_slot
        get :slots_status
        get :get_slots
        delete :delete_slot
      end
    end
    resources :events do
      member do
        get :action
        get :add_slot
        get :status
        delete :remove_slot
      end
    end

  end

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
  root :to => 'transcoder_console#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
