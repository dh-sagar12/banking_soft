class Transaction::MasterLedger < ApplicationRecord
  has_many :group_ledgers, class_name: "Transaction::GroupLedger", foreign_key: "master_ledger_id"
end
