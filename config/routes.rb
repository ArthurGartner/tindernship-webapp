Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "login#index"
  get "/login/student", to: "login#student"
  post "/login/student", to: "login#post_student"
  get "/register", to: "login#register"
  post "/register", to: "login#post_register"
  get "/login/employer", to: "login#employer"
  post "/login/employer", to: "login#post_employer"
  get "/admin", to: "login#admin"
  post "/admin", to: "login#post_admin"
end
