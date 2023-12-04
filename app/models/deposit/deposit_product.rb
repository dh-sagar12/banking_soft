class Deposit::DepositProduct < ApplicationRecord
  belongs_to :interest_posting_frequency, class_name: "Core::Frequency"
  belongs_to :interest_calculation_type, class_name: "Deposit::DepositInterestCalcType"
  belongs_to :branch, class_name: "Auth::Branch"
  belongs_to :creator, class_name: "Auth::User"
  enum :product_type, { fixed: "Fixed", saving: "Saving", recurring: "Recurring" }, prefix: true, allow_nil: false

  # validations

  validates :product_name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5 }
  validates :product_name_np, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5 }
  validates :prefix, presence: false, uniqueness: { case_sensitive: false }
  validates :suffix, presence: false, uniqueness: { case_sensitive: false }, allow_nil: true
  validates :acc_digit, presence: true
  validates :product_type, presence: true
  validates :interest_rate, presence: true
  validates :tran_gl_id, presence: true
  validates :tax_gl_id, presence: true
  validates :interest_expenses_gl_id, presence: true
  validates :interest_payable_gl_id, presence: true
  validates :interest_payable_gl_id, presence: true

  validate :validate_duration_for_recurring_and_fixed
  validate :set_duration_for_normal_product

  def validate_duration_for_recurring_and_fixed
    puts "#" * 100

    puts product_type

    puts "#" * 100

    if (product_type.downcase == "recurring" || product_type.downcase == "fixed") && (duration.nil? || duration == 0)
      errors.add(:duration, "Duration is compulsory for Recurring & Fixed products")
    end
  end

  def set_duration_for_normal_product
    if product_type.downcase == "saving" && !duration.nil?
      self.duration = nil
    end
  end
end
