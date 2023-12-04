class Core::Province < ApplicationRecord
  has_many :kyc_addresses, class_name: "Kyc::KycAddress", foreign_key: "province"
  has_many :districts, class_name: "Core::District", foreign_key: "province_id"
end
