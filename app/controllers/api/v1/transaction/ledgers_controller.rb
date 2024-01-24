class Api::V1::Transaction::LedgersController < ApplicationController
  def create_group_ledgers
    @group_ledger = Transaction::GroupLedger.new(set_group_ledger_params)

    if @group_ledger.save
      render json: {
        status: 201,
        message: "Group GL Created Successfully",
        data: @group_ledger,

      }, status: :created
    else
      render json: {
        status: 422,
        message: "Group GL Creation Failed",
        data: @group_ledger.errors.full_messages,
      }, status: :unprocessable_entity
    end
  end

  def get_master_ledgers
    @master_ledger = Transaction::MasterLedger.all
    render json: {
      status: 200,
      message: "Fetched Master Ledger",
      data: @master_ledger,
    }, status: :ok
  end

  def get_group_ledgers
    @group_ledgers = Transaction::GroupLedger.all.paginate(page: params[:page], per_page: params[:per_page])
    render json: {
      status: 200,
      message: "Fetched Group Ledger",
      total_pages: @group_ledgers.total_pages,
      current_page: @group_ledgers.current_page,
      total_entries: @group_ledgers.total_entries,
      data: Transaction::GroupLedgerSerializer.new(@group_ledgers).serializable_hash[:data],
    }, status: :ok
  end

  private

  def set_group_ledger_params
    params.require(:ledger).permit(:account_code, :account_name, :account_name_np, :is_active, :master_ledger_id)
  end
end
