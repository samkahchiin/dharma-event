FactoryGirl.define do
  factory :price do
    price_type { Price::TYPE.sample }
    amount     { rand(100) }
  end
end
