class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionFix

  respond_to :json
  before_action :configure_sign_up_params, only: [:create]

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
               status: 200,
               message: "User registered successfully!!",
               data: UserSerializer.new(resource).serializable_hash[:data][:attributes],
             }, status: :created
    else
      render json: {
               status: 422,
               message: "User Registration failed!!",
               data: resource.errors.full_messages,
             }, status: :unprocessable_entity
    end
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
  end
end
