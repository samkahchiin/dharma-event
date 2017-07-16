FactoryGirl.define do
  factory :price do
    price_type { Price::TYPES.sample }
    amount     { rand(100) }
  end
end
