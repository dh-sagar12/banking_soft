class Transaction::TransactionLedger < ApplicationRecord
  validates :account_name, presence: true, uniqueness: { case_sensitive: false }
  validates :account_name_np, presence: true, uniqueness: { case_sensitive: false }
  validates :account_code, presence: true, uniqueness: { case_sensitive: false }
  validates :group_ledger, presence: true

  belongs_to :group_ledger, class_name: "Transaction::GroupLedger"
  belongs_to :creator, class_name: "Auth::User"
  belongs_to :branch, class_name: "Auth::Branch"
end
