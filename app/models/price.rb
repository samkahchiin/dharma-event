class Price < ApplicationRecord
  TYPE = ["Public", "Member", "Non-member", "Student", "Other"]
  validates :price_type, :amount, presence: true
end
