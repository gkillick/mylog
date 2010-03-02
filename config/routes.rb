ActionController::Routing::Routes.draw do |map|
map.resources :activities
map.resources :sports
map.resource :user_session 
map.resources :users
map.resources :athletes, :member => { :dashboard => :get } do |athletes| 
  athletes.resources :log_entries
end
  map.root :controller => "user_sessions", :action => "new"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
