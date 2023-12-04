class Core::MnVdc < ApplicationRecord
  belongs_to :district, class_name: "Core::District"
  has_many :kyc_addresses, class_name: "Kyc:Addresss", foreign_key: "mn_vdc"
end
