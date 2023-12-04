class Deposit::DepositIntCalcTypes < ApplicationRecord
  has_many :deposit_products, class_name: "Deposit::Product", foreign_key: "interest_calculation_type_id"
end
