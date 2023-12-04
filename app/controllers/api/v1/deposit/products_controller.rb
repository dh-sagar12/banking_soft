class Api::V1::Deposit::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:update]

  def index
    @products = Deposit::DepositProduct.all.paginate(page: params[:page], per_page: params[:per_page])
    render json: {
      status: 200,
      message: "Data Fetched",
      total_pages: @products.total_pages,
      current_page: @products.current_page,
      total_entries: @products.total_entries,
      data: Deposit::ProductSerializer.new(@products).serializable_hash[:data],

    }
  end

  def create
    @product = Deposit::DepositProduct.new(set_product_data)
    @product.creator = current_user

    puts @product.interest_posting_frequency
    if @product.save
      render json: {
        status: 201,
        message: "Product Creation Success",
        data: @product,
      }, status: :created
    else
      render json: {
        status: 422,
        message: "Product Creation Failed!!",
        data: @product.errors.full_messages,
      }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(set_product_data)
      render json: {
               status: 200,
               message: "Product Updated Successfully",
               data: Deposit::ProductSerializer.new(@product).serializable_hash[:data][:attributes],
             }, status: :ok
    else
      render json: {
               status: 422,
               message: "Product Updated Failed",
               data: @product.errors.full_messages,
             }, status: :unprocessable_entity
    end
  end

  private

  def set_product_data
    params.require(:deposit_product).permit(:branch_id, :product_name, :product_name_np, :prefix, :suffix, :acc_digit, :product_type, :duration, :minimum_balance, :interest_rate, :interest_posting_frequency_id, :interest_calculation_type_id, :tran_gl_id, :interest_expenses_gl_id, :interest_payable_gl_id, :tax_gl_id, :is_active, :tax_rate)
  end

  def set_article
    # filter_param = params.require(:deposit_product).permit(:id)
    @product = Deposit::DepositProduct.find(params[:id])
  end
end
