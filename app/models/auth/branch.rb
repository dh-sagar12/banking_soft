class Auth::Branch < ApplicationRecord
  belongs_to :creator, class_name: "Auth::User"

  has_many :branch_policies
  has_many :users, through: :branch_policies
  has_many :users, class_name: "Auth::User", foreign_key: "branch_id"
  has_many :customers, class_name: "Kyc::Customer", foreign_key: "branch_id"
  has_many :deposit_products, class_name: "Deposit:DepositProduct", foreign_key: "branch_id"
  has_many :deposit_accounts, class_name: "Deposit::DepositAccount", foreign_key: "branch_id"
end
