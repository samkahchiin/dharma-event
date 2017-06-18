require 'rails_helper'

RSpec.describe Price, type: :model do
  it { is_expected.to validate_presence_of(:price_type) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_inclusion_of(:price_type).in_array(Price::TYPES) }
end
