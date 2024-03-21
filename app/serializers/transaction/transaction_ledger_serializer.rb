class Transaction::TransactionLedgerSerializer
  include JSONAPI::Serializer
  attributes :id, :account_code, :account_name, :account_name_np, :group_ledger, :is_active, :branch, :creator
end
