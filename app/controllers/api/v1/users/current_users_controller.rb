class Api::V1::Users::CurrentUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: {
             status: 200,
             data: UserSerializer.new(current_user).serializable_hash[:data][:attributes],
           }
  end
end
