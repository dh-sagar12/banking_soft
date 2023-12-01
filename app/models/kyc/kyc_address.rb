class Kyc::KycAddress < ApplicationRecord
  validates :address_type, presence: true
  validates :district, presence: true
  validates :province, presence: true
  validates :mn_vdc, presence: true
  validates :ward_no, presence: true

  enum :address_type, { permanent: "Permanent", temporary: "Temporary", Other: "Other" }, prefix: true, allow_nil: false
  belongs_to :kyc_personal, class_name: "Kyc::KycPersonal"
end
