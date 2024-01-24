class Transaction::GroupLedger < ApplicationRecord
  validates :account_name, presence: true, uniqueness: { case_sensitive: false }
  validates :account_name_np, presence: true, uniqueness: { case_sensitive: false }
  validates :account_code, presence: true, uniqueness: { case_sensitive: false }
  validates :master_ledger, presence: true

  belongs_to :master_ledger, class_name: "Transaction::MasterLedger"
end
