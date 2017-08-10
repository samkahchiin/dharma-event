FactoryGirl.define do
  factory :event do
    user
    title          { Faker::Book.title }
    start_time     { Date.today + 1.week }
    end_time       { Date.today + 2.week }
    speaker        { Faker::Superhero.name }
    description    { Faker::Lorem.sentence }
    contact        { Faker::PhoneNumber.cell_phone }
    location       { Faker::Address.street_address }
    area           { Event::AREAS.sample }
    organizer_name { Faker::Name.name_with_middle }
    language       { Event::LANGUAGES.values.sample }
    status         { Event::STATUSES[:pending] }
    register_link  { Faker::Internet.url }
    prices         { create_list(:price, 2) }
  end

  trait :approved do
    status { Event::STATUSES[:approved] }
  end

  trait :rejected do
    status { Event::STATUSES[:rejected] }
  end
end
