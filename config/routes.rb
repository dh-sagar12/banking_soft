Rails.application.routes.draw do
  # authenticate :user do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  # end"

  devise_for :users,
             class_name: "Auth::User",
             path: "/api/v1",
             path_names: {
               sign_in: "login",
               sign_out: "logout",
               registration: "signup",
             },
             controllers: {
               sessions: "api/v1/users/sessions",
               registrations: "api/v1/users/registrations",
             }

  namespace :api do
    namespace :v1 do
      namespace :users do
        get "current_user" => "current_users#index", as: :current_users
      end
    end
  end

  namespace :api do
    namespace :v1 do
      namespace :kyc do
        post "new_customer" => "customers#create", as: :new_customer
      end
    end
  end
end
