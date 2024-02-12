Rails.application.routes.draw do
  get "/new" , to: "employees#new" , as: "new_employee"
  get "/index" , to: "employees#index" , as: "show_all_employee"
  post "/create" , to: "employees#create" , as: "create_employee"
  get "/edit/:id" , to: "employees#edit" , as: "edit_employee"
  patch "/update/:id" , to: "employees#update" , as: "update_employee"
  get "/deleted" , to: "employees#delete_employees", as: "deleted_employee"
  patch "/restore/:id" , to: "employees#restore_employee", as: "restore_employee"
  delete "/destroy/:id" , to: "employees#destroy" , as: "delete_employee"

  get '/index' , to: 'users#index', as: "user_index"
  get "/signup" ,to: "users#new_signup", as:"sign_up"
  post "/signup" ,to: "users#sign_up", as:"user_signup"
  post "/login", to: "users#login", as: "user_login"
  get "/login", to: "users#new_login", as: "login"
  delete '/logout/:id' , to: 'users#destroy', as: "user_logout"
 
 
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "users#index"
end
