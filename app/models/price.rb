class Price < ApplicationRecord
  TYPES = [
    "Public",
    "Member",
    "Non-member",
    "Student",
    "Other"
  ].freeze
  validates :price_type, :amount, presence: true
  validates :price_type, inclusion: TYPES
end
