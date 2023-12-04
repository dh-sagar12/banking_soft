class Deposit::ProductSerializer
  include JSONAPI::Serializer
  attributes :id, :branch, :product_name, :product_name_np, :product_type, :prefix, :suffix, :acc_digit, :duration, :minimum_balance, :interest_rate, :interest_posting_frequency, :interest_calculation_type, :tran_gl_id, :interest_expenses_gl_id, :interest_payable_gl_id, :tax_gl_id, :tax_rate, :is_active, :created_at, :updated_at
end
