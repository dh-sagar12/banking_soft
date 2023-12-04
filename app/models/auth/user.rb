class Auth::User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  validates :full_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :branches, class_name: "Auth::Branch", foreign_key: "creator_id"

  has_many :branch_policies
  has_many :branches, through: :branch_policies
  belongs_to :branch
  has_many :customers, class_name: "Kyc::Customer", foreign_key: "creator_id"
  has_many :deposit_products, class_name: "Deposit::DepositProduct", foreign_key: "creator_id"
  has_many :deposit_accounts, class_name: "Deposit::DepositAccount", foreign_key: "creator_id"
  has_many :last_update_deposit_accounts, class_name: "Deposit::DepositAccount", foreign_key: "creator_id"
end
