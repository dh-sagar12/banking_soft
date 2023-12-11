class Kyc::KycAddress < ApplicationRecord
  validates :address_type, presence: true
  validates :district, presence: true
  validates :province, presence: true
  validates :mn_vdc, presence: true
  validates :ward_no, presence: true

  enum :address_type, { permanent: "Permanent", temporary: "Temporary", Other: "Other" }, prefix: true, allow_nil: false
  belongs_to :kyc_personal, class_name: "Kyc::KycPersonal"
  belongs_to :province, class_name: "Core::Province"
  belongs_to :district, class_name: "Core::District"
  belongs_to :mn_vdc, class_name: "Core::MnVdc"
end
