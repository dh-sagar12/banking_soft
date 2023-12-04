class Core::Frequency < ApplicationRecord
  has_many :deposit_products, class_name: "Deposit::DepositProduct", foreign_key: "interest_posting_frequency_id"
  has_many :deposit_accounts_with_interest_frequency, class_name: "Deposit::DepsoitAccount", foreign_key: "interest_frequency_id"
  has_many :deposit_accounts_with_installment_frequency, class_name: "Deposit::DepsoitAccount", foreign_key: "installment_frequency_id"
end
