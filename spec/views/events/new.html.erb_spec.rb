require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :title => "MyString",
      :speaker => "MyString",
      :description => "MyText",
      :contact => "MyString",
      :location => "MyString",
      :price => ""
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "input#event_speaker[name=?]", "event[speaker]"

      assert_select "textarea#event_description[name=?]", "event[description]"

      assert_select "input#event_contact[name=?]", "event[contact]"

      assert_select "input#event_location[name=?]", "event[location]"

      assert_select "input#event_price[name=?]", "event[price]"
    end
  end
end
