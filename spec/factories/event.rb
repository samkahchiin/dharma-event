FactoryGirl.define do
  factory :event do
    title
    start_time
    end_time
    speaker
    description
    contact
    location
    organizer_name
    area
    language
    register_link
    status
    # user
    # price
  end
end
