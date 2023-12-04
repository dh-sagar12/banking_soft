class Core::District < ApplicationRecord
  has_many :kyc_addresses, class_name: "Kyc::KycAddress", foreign_key: "district"
  has_many :mn_vdcs, class_name: "Core::MnVdc", foreign_key: "district_id"

  belongs_to :province, class_name: "Core::Province"
end
