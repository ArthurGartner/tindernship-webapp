Rails.application.routes.draw do
  get 'dashboard/index'
  get 'dashboard', to: 'dashboard#index'  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "index#index"
end
