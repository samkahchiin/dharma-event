require "rails_helper"

feature "event", js: true, type: :feature do
  let(:event1) do
    create :event, :approved,
          start_time: Date.today + 1.day
  end

  let(:event2)  do
    create :event, :approved,
          start_time: Date.today + 1.year,
          end_time: Date.today + 370.days
  end

  let!(:approved_events) do
    events = create_list :event, 3, :approved
    events << event1 << event2
  end

  let!(:pending_events)  { create_list :event, 5 }
  let!(:rejected_events) { create_list :event, 5, :rejected }

  let(:home_page) do
    visit root_path
    HomePage.new
  end

  describe "index" do
    before do
      home_page
    end

    it "should display all approved events" do
      events = home_page.events
      titles = events.map { |event| event.title.text }
      expect(titles).to match_array approved_events.map(&:title)

      # NOTE: Test for sorting
      first_event = events.first
      expect(first_event.start_time.text).to eq event1.start_time.strftime("%a, %d %b %Y, %R %P")
      expect(first_event.location.text).to eq event1.location

      last_event = events.last
      expect(last_event.start_time.text).to eq event2.start_time.strftime("%a, %d %b %Y, %R %P")
      expect(last_event.location.text).to eq event2.location
    end
  end

  describe "show" do
    let(:event_show_page) do
      home_page.events.first.title.click
      EventShowPage.new
    end

    before do
      event_show_page
    end

    it "should display all the information" do
      expect(event_show_page.organizer.text).to eq "by " + event1.organizer_name

      [
        :title,
        :description,
        :speaker,
        :language,
        :contact,
        :area
      ].each do |attr|
        expect(event_show_page.send(attr).text).to eq event1.send(attr)
      end

      expect(event_show_page.detailed_start_time.text).to eq event1.start_time.strftime("%F %R %P")
      expect(event_show_page.detailed_end_time.text).to eq event1.end_time.strftime("%F %R %P")

      prices = event_show_page.prices
      expect(prices.first.price_type.text).to eq event1.prices.second.price_type
      expect(prices.first.amount.text).to eq event1.prices.second.amount.to_s
      expect(prices.second.price_type.text).to eq event1.prices.first.price_type
      expect(prices.second.amount.text).to eq event1.prices.first.amount.to_s
    end
  end
end
