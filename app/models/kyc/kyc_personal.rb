class Kyc::KycPersonal < ApplicationRecord
  validates :salutation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :date_of_birth, presence: true
  validates :maritial_status, presence: true

  enum :salutation, { mister: "Mr", miss: "Ms", mistress: "Mrs", other: "Other" }, prefix: true
  enum :gender, { male: "Male", female: "Female", other: "Other", non: "NotSpecified" }, prefix: true
  enum :maritial_status, { single: "Single", married: "Married", un_married: "UnMarried", divorced: "Divorced", seperated: "Seperated" }, prefix: true

  belongs_to :customer, class_name: "Kyc::Customer"
  has_many :kyc_contacts, class_name: "Kyc::KycContact", foreign_key: "kyc_personal_id"
  has_many :kyc_addresses, class_name: "Kyc::KycAddress", foreign_key: "kyc_personal_id"
end
