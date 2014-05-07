Buscms::Application.routes.draw do


  get "admin/export/to_xls", :as => :export_to_xls
  get "admin/export/to_pdf", :as => :export_to_pdf

  devise_for :admins
  devise_for :dealers, :controllers => {:confirmations => "confirmations"}
  devise_for :users

  #match 'admin/contact'                       => 'admin/contact#index', :via  => [:get, :post], :as => :admin_dashboard
  match 'admin/bus_type' => 'admin/bus_types#create', :via => [:post, :put]
  match 'admin/chasis_makes' => 'admin/chasis_makes#create', :via => [:post, :put]
  match 'admin/images' => 'admin/images#create', :via => [:post, :put]
  match 'admin/inventory/search' => 'admin/inventory#search', :via => [:get, :post]
  match 'admin/inventory/update_status' => 'admin/inventory#update_status', :via => [:get, :post]
  match 'admin/leads/search_leads' => 'admin/leads#search_leads', :via => [:get, :post]
  match 'admin/export/to_xls' => 'admin/export#to_xls', :via => [:get, :post]
  match 'admin/export/to_xls_leads' => 'admin/export#to_xls_leads', :via => [:get, :post]
  match 'admin/export/to_pdf' => 'admin/export#to_pdf', :via => [:get, :post]
  match 'admin/export/to_pdf_multiple' => 'admin/export#to_pdf_multiple', :via => [:get, :post]
  match 'admin/export/to_pdf_multiple_leads' => 'admin/export#to_pdf_multiple_leads', :via => [:get, :post]
  match 'admin/export/destroy' => 'admin/inventory#destroy', :via => [:get], :as => :delete_inventory
  match 'admin/dealers/destroy' => 'admin/dealers#destroy', :via => [:get], :as => :delete_dealers
  match 'admin/users/destroy' => 'admin/users#destroy', :via => [:get], :as => :delete_users
  match 'admin/leads/destroy' => 'admin/leads#destroy', :via => [:get], :as => :delete_leads
  match 'admin/export/to_zip' => 'admin/export#to_zip', :via => [:get], :as => :zip_inventory
  match 'addtocompare' => 'home#addtocompare', :via => [:get], :as => :add_to_compare
  match 'removefromcompare' => 'home#removefromcompare', :via => [:get], :as => :remove_from_compare
  match 'admin/adds/delete_bulk_ads' => 'admin/adds#delete_bulk_ads', :via => [:get], :as => :remove_from_add
  match 'admin/adds/filter' => 'admin/adds#filter', :via => [:get], :as => :filter_add
  match '/generate_stock_id' => 'home#generate_stock_id', :via => [:get], :as => :generate_stock_id

  namespace :admin do
    resources :users
    match 'users/confirm_user_account/:id' => 'users#confirm_account', :via => [:get], :as => :confirm_user_account
    match 'dealers/confirm_dealer_account/:id' => 'dealers#confirm_account', :via => [:get], :as => :confirm_dealer_account
    match 'users/deactivate_account/:id' => 'users#deactivate_account', :via => [:get], :as => :deactivate_account
    match 'settings/update_settings' => 'settings#update_settings'
    match 'leads/send_email' => 'leads#send_email', :via => :post
    match 'leads/create_blast' => 'leads#create_blast', :via => :get
    match 'leads/remove_stock_session' => 'leads#remove_stock_session', :via => :get
    match 'leads/add_stock' => 'leads#add_stock', :via => :get
    match 'leads/blast_step3' => 'leads#blast_step3', :via => :get
    match 'leads/blast_last_step' => 'leads#blast_last_step', :via => :post
    match 'leads/send_blast' => 'leads#send_blast', :via => :post
    match 'leads/search' => 'leads#search'

    match 'search' => 'search#index'
    match 'recyclebins/restore' => 'recyclebins#restore'
    match 'recyclebins/restore_all' => 'recyclebins#restore_all'
    match 'recyclebins/restore_all_current_bin' => 'recyclebins#restore_all_current_bin'
    match 'recyclebins/empty_all' => 'recyclebins#empty_all'
    match 'recyclebins/empty_bin' => 'recyclebins#empty_bin'
    match 'recyclebins/set_delete_timer' => 'recyclebins#set_delete_timer'

    resources :images #, :only => [:index, :create, :destroy]
    resources :bus_type
    resources :inventory

    resources :contact
    resources :sold_inventory
    resources :settings
    resources :leads
    resources :chasis_makes
    resources :body_makes
    resources :dealers
    resources :stats
    resources :recyclebins
    resources :adds 
  end
  match 'listings/compare' => 'listings#compare', :via => :get
  match 'listings/search' => 'listings#search'
  match 'listings/:slug' => 'listings#index', :via => :get, :as => :buses_search, :slug => /[a-z-]{0,}/
  match 'contact/new_lead' => 'contact#new_lead', :via => [:post], :as => :new_lead

  resources :contact
  resources :listings, :only => [:show, :index, :search , :send_mail_to_friend, :send_inquiry_received_email] do
    collection do
      match 'search' => 'listings#search', :via => :get, :as => :search
      post 'send_friend_mail' => 'listings#send_mail_to_friend'
      post 'send_inquiry_received_email' => 'listings#send_inquiry_received_email'
    end
  end
  resources :dealer

  match 'cron/cron_to_update_bus_stats' => 'home#cron_to_update_bus_stats'
  match "/admin", :to => redirect("/admin/dashboard")
  match 'admin/dashboard' => 'admin/dashboard#index', :via => [:get, :post], :as => :admin_dashboard
  match 'services' => 'home#services', :as => :services
  match 'about' => 'home#about', :as => :about
  match 'contact' => 'contact#index', :as => :contact
  match 'submit_vehicle' => 'home#submit_vehicle', :as => :submit_vehicle
  match 'dealer' => 'dealer#index', :as => :dealer
  match 'add_new_vehicle' => 'home#add_new_vehicle', :as => :add_new_vehicle
  match 'compare' => 'home#compare', :as => :compare
  match 'temp' => 'temp_uploader#upload' , :as => :temp
  match '/admin/adds/update' => 'admin/adds#update'
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
  root :to => 'listings#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
