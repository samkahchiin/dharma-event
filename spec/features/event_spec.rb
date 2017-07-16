require "rails_helper"

feature "event", js: true, type: :feature do
  describe "index" do
    let!(:approved_events) { create_list :event, 5, :approved }
    let!(:pending_events)  { create_list :event, 5 }
    let!(:rejected_events) { create_list :event, 5, :rejected }

    describe "" do
      before do
        visit root_path
      end

      it "should display all approved events" do
        scroll_down
        debugger
      end
    end
  end
end
