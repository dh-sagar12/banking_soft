class Deposit::Product < ApplicationRecord
  belongs_to :frequency, class_name: "Core::Frequency"
  belogns_to :deposit_interest_calculation_type, class_name: "Deposit::DepositInterestCalcType"
  enum :product_type, { fixed: "Fixed", saving: "Saving", recurring: "Recurring" }, prefix: true, allow_nil: false
end
