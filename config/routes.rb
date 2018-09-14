Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :assignments
      resources :roles
      resources :events
      resources :festivals
      resources :users
      resources :bookings
      resources :areas
      post "/login", to: 'users#login'
      get "/festival_areas/:id", to: 'areas#festival_areas'
      get "/festival_events/:id", to: 'events#festival_events'
      get "/festival_categories/:id", to: 'events#festival_categories'
      get "/current_user", to: 'users#get_current_user'
      get "/users/:id/managedfestivals", to: 'users#get_managed_festivals'
      get "/users/:id/festivals", to: 'users#get_user_festivals'
      post "/users/:id/new_festival", to: 'festivals#create'
      post "/users/:id/festivals/", to: 'users#set_festival'
      delete "/users/:id/events", to: 'users#delete_event'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
