require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :title => "Title",
        :speaker => "Speaker",
        :description => "MyText",
        :contact => "Contact",
        :location => "Location",
        :price => ""
      ),
      Event.create!(
        :title => "Title",
        :speaker => "Speaker",
        :description => "MyText",
        :contact => "Contact",
        :location => "Location",
        :price => ""
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Speaker".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
