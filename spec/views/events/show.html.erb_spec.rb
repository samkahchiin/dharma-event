require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :title => "Title",
      :speaker => "Speaker",
      :description => "MyText",
      :contact => "Contact",
      :location => "Location",
      :price => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Speaker/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(//)
  end
end
