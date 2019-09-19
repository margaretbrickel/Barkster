Rails.application.routes.draw do
 root 'dogs#index'
 resources :dogs
end
