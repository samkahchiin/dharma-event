FactoryGirl.define do
  factory :event do
    user
    title          { Faker::Book.title }
    start_time     { 1.week.ago }
    end_time       { 3.days.ago }
    speaker        { Faker::Superhero.name }
    description    { Faker::Lorem.sentence }
    contact        { Faker::PhoneNumber.cell_phone }
    location       { Faker::Address.street_address }
    area           { Event::AREA.sample }
    organizer_name { Faker::Name.name_with_middle }
    language       { Event::LANGUAGE.sample }
    status         { Event::STATUS.sample }
    register_link  { Faker::Internet.url }
    prices         { create_list(:price, 2) }
  end
end
