class Price < ApplicationRecord
  TYPE = [
    "Public",
    "Member",
    "Non-member",
    "Student",
    "Other"
  ].freeze
  belongs_to :event
  validates :price_type, :amount, presence: true
  validates :price_type, inclusion: TYPE
end
