Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  get "about_us" => "about_us#company_profile", :as => "company_profile"
  post "contact_us" => "about_us#contact_us", :as => "contact_us"
  get "career" => "about_us#career", :as => "career"
# get "galleries"  => "galleries#index", :as => "galleries"
  get "galleries/:permalink"  => "galleries#show", :as => "gallery"
  get "news" => "news#index", :as => "news"
  get "news/:permalink" => "news#show", :as => "news_detail"
#  get "passport" => "travel_document#passport", :as => "passport"
  get "privacy_policy" => "about_us#privacy_policy", :as => "privacy_policy"
  get "service/hotels" => "hotels#index", :as => "hotels"
  get "service/tickets" => "tickets#index", :as => "tickets"
  get "service/package/:permalink" => "packages#show", :as => "package"
  get "service/:permalink" => "services#show", :as => "services"
  get "term_conditions" => "about_us#term_conditions", :as => "term_conditions"
  get "visa" => "travel_document#visa", :as => "visa"
  get "/service/visa/:permalink" => "travel_document#visa_detail", :as => "visa_detail"

  get    '/login' => 'session#new', :as => "login"
  post   '/login' => 'session#create', :as => "login_create"
  delete '/logout' => 'session#destroy', :as => "logout"


#  resources :contact_us, :only => [:index, :create]
#  resources "tours"

  get "admin" => "admin/dashboard#index", :as => "admin"
  namespace :admin do
    resources "banners"
    resources "continents"
    resources "countries" do
      member do
        resources :country_galleries, :param => :gallery_id
      end
    end
    resources "galleries"
    resources "hotels"
    resources "packages"
    resources "news"
    resources "services", :only => [:index, :edit, :update]
    resources "system_settings", :only => [:index, :edit, :update]
    resources "tickets"
#    resources "tours"do
#      member do
#        resources :tour_images, :param => :tour_image_id
#        resources :tour_itineraries, :param => :tour_itinerary_id
#      end
#    end
  end

  root 'home#index'
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
