class Core::Frequency < ApplicationRecord
  has_many :deposit_products, class_name: "Deposit::DepositProduct", foreign_key: "interest_posting_frequency_id"
end
