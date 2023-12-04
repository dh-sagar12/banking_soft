class Deposit::DepositInterestCalcType < ApplicationRecord
  has_many :deposit_products, class_name: "Deposit::DepositProduct", foreign_key: "interest_calculation_type_id"
end

# deposit_int_calc_types
#
# deposit_interest_calc_types
