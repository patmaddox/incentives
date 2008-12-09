ActionController::Routing::Routes.draw do |map|
  map.resources :carts
  map.resources :incentives
  map.resources :incentive_campaigns
  map.resources :message_actions
end
