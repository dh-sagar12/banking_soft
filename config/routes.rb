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
        get "filter_customers" => "customers#index", as: :all_customer
      end
    end
  end

  namespace :api do
    namespace :v1 do
      namespace :deposit do

        #product
        post "new_product" => "products#create", as: :new_product
        patch "update_product/:id" => "products#update", as: :update_product
        get "filter_product" => "products#index", as: :all_products

        #account
        post "new_account" => "accounts#create", as: :new_deposit_account
        patch "update_account/:id" => "accounts#update", as: :update_account
        get "filter_account" => "accounts#index", as: :all_accounts
      end
    end
  end

  namespace :api do
    namespace :v1 do
      namespace :core do

        #branches
        get "get_branches" => "branches#index", as: :all_branches
        get "get_addresses" => "addresses#retrive_district_mn_vdc_province", as: :all_addresses
      end
    end
  end
end
