require "rails_helper"

feature "event", js: true, type: :feature do
  describe "index" do
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
end
