class Transaction::GroupLedgerSerializer
  include JSONAPI::Serializer
  attributes :id, :account_code, :account_name, :account_name_np, :master_ledger, :is_active
end
