class Kyc::KycContact < ApplicationRecord
  validates :contact_type, presence: true
  validates :contact_relation, presence: true
  validates :contact_number, presence: true

  enum :contact_type, { mobile: "Mobile", landline: "LandLine", fax: "Fax", other: "Other" }, prefix: true

  enum :contact_relation, { self: "Self", father: "Father", mother: "Mother", grandfather: "GrandFather", grandmother: "GrandMother", spouse: "Spouse", other: "Other" }, prefix: true

  belongs_to :kyc_personal, class_name: "Kyc::KycPersonal"
end
