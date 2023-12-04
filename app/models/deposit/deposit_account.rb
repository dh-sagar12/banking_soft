class Deposit::DepositAccount < ApplicationRecord
  belongs_to :branch, class_name: "Auth::Branch"
  belongs_to :customer, class_name: "Kyc::Customer"
  belongs_to :deposit_product, class_name: "Deposit::DepositProduct"
  belongs_to :interest_nominee, class_name: "Deposit::DepositAccount", optional: true
  belongs_to :account_nominee, class_name: "Deposit::DepositAccount", optional: true
  belongs_to :interest_frequency, class_name: "Core::Frequency"
  belongs_to :installment_frequency, class_name: "Core::Frequency", optional: true
  belongs_to :installment_account, class_name: "Deposit::DepositAccount", optional: true
  belongs_to :creator, class_name: "Auth::User"
  belongs_to :last_update_by, class_name: "Auth::User"

  validates :account_number, presence: true, uniqueness: { case_sensitive: false }
  validates :interest_rate, presence: true
  validates :interest_nominee, presence: true, allow_nil: true
  validates :account_nominee, presence: true, allow_nil: true
  validates :installment_frequency, presence: true, allow_nil: true
  validates :installment_account, presence: true, allow_nil: true
end
