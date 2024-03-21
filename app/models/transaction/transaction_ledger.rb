class Transaction::TransactionLedger < ApplicationRecord
  validates :account_name, presence: true, uniqueness: { case_sensitive: false }
  validates :account_name_np, presence: true, uniqueness: { case_sensitive: false }
  validates :account_code, presence: true, uniqueness: { case_sensitive: false }
  validates :group_ledger, presence: true

  belongs_to :group_ledger, class_name: "Transaction::GroupLedger"
end
