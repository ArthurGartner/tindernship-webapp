Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "login#index"
  get "/login/student", to: "login#student"
  post "/login/student", to: "login#poststudent"
  get "/register", to: "login#register"
  post "/register", to: "login#postregister"
  get "/login/employer", to: "login#employer"
  post "/login/employer", to: "login#postemployer"
end
