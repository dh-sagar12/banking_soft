class Api::V1::Core::BranchesController < ApplicationController
  def index
    @branches = Auth::Branch.all
    render json: {
      status: 200,
      message: "Data Fetched",
      data: @branches,
    }
  end
end
