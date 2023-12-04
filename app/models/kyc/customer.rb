class Kyc::Customer < ApplicationRecord
  belongs_to :creator, class_name: "Auth::User"
  belongs_to :branch, class_name: "Auth::Branch"
  has_many :kyc_personals, class_name: "Kyc::KycPersonal", foreign_key: "customer_id"
  has_many :deposit_accounts, class_name: "Deposit::DepositAccount", foreign_key: "customer_id"
end
