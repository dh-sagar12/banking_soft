class Api::V1::Deposit::AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deposit_account, only: [:update]

  def index
    @accounts = Deposit::DepositAccount.all.paginate(page: params[:page], per_page: params[:per_page])

    render json: {
      status: 200,
      message: "Data Fetched",
      total_pages: @accounts.total_pages,
      current_page: @accounts.current_page,
      total_entries: @accounts.total_entries,
      data: Deposit::AccountSerializer.new(@accounts).serializable_hash[:data],

    }
  end

  def create
    @account = Deposit::DepositAccount.new(set_deposit_account_data)
    @account.creator = current_user
    @account.last_update_by = current_user

    if @account.save
      render json: {
        status: 201,
        message: "Account Opened Successfully",
        data: Deposit::AccountSerializer.new(@account).serializable_hash[:data][:attributes],

      }, status: :created
    else
      render json: {
        status: 422,
        message: "Account Open Failed",
        data: @account.errors.full_messages,
      }, status: :unprocessable_entity
    end
  end

  def update
    if @account.update(set_deposit_account_data)
      render json: {
               status: 200,
               message: "Account Updated Successfully",
               data: Deposit::AccountSerializer.new(@account).serializable_hash[:data][:attributes],
             }, status: :ok
    else
      render json: {
               status: 422,
               message: "Account Updated Failed",
               data: @account.errors.full_messages,
             }, status: :unprocessable_entity
    end
  end

  private

  def set_deposit_account_data
    params.require(:deposit_account).permit(:branch_id, :account_opening_date, :customer_id, :deposit_product_id, :account_id, :account_number, :introducer_id, :interest_rate, :account_duration, :interest_frequency_id, :interest_nominee_id, :account_nominee_id, :status, :terminated_on, :minimum_balance, :installment_amount, :installment_frequency_id, :installment_account_id, :joint_customers, :account_name, :display_address)
  end

  def set_deposit_account
    @account = Deposit::DepositAccount.find(params[:id])
  end
end
