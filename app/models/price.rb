class Price < ApplicationRecord
  TYPE = [
    "Public",
    "Member",
    "Non-member",
    "Student",
    "Other"
  ].freeze
  validates :price_type, :amount, presence: true
  validates :price_type, inclusion: TYPE
end
