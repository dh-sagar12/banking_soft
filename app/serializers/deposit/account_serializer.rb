class Deposit::AccountSerializer
  include JSONAPI::Serializer
  attributes :id, :branch_id, :account_opening_date, :customer, :deposit_product, :account_id, :account_number, :introducer_id, :interest_rate, :account_duration, :interest_frequency, :interest_nominee, :account_nominee, :status, :terminated_on, :minimum_balance, :installment_amount, :installment_frequency, :installment_account, :joint_customers, :account_name, :display_address, :creator, :last_update_by
end
