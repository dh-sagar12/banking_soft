class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json
  prepend_before_action :configure_login_params

  def create
    if has_branch_access?
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      render json: {
        status: 401,
        message: "Branch Policy Not Exists!!",
        data: [],
      }, status: :unauthorized
    end
  end

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: 200,
      message: "Logged In Success!!",
      data: [UserSerializer.new(resource).serializable_hash[:data][:attributes]],
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: "logged out successfully",
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session.",
      }, status: :unauthorized
    end
  end

  private

  def configure_login_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:branch_id])
  end

  def has_branch_access?
    branch_id = params[resource_name][:branch_id]
    user = valid_user
    if user.present?
      user.
        branch_policies.
        where(
        "
        branch_id =  ?
        AND date_access_from < ?
        AND date_access_to > ?
        AND time_access_from < ?
        AND time_access_to > ?
      ", branch_id, Date.current, Date.current, Time.current, Time.current
      ).any?
    else
      true
    end
  end

  def valid_user
    email = params[resource_name][:email]
    Auth::User.find_by(email: email)
  end
end
