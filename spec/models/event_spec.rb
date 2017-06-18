require 'rails_helper'

RSpec.describe Event, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:prices) }
  it { is_expected.to accept_nested_attributes_for(:prices).allow_destroy(true) }
  it { is_expected.to validate_inclusion_of(:status).in_array(Event::STATUS) }
  it { is_expected.to validate_inclusion_of(:area).in_array(Event::AREA) }
  it { is_expected.to validate_inclusion_of(:language).in_array(Event::LANGUAGE) }

  it { is_expected.to validate_presence_of(:language) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:end_time) }
  it { is_expected.to validate_presence_of(:speaker) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:contact) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:area) }
  it { is_expected.to validate_presence_of(:organizer_name) }
  it { is_expected.to validate_presence_of(:language) }
  it { is_expected.to validate_presence_of(:status) }

  describe "approve" do
    let!(:pending_events)  { create_list(:event, 2) }
    let!(:approved_events) { create_list(:event, 2, :approved) }
    let!(:rejected_events) { create_list(:event, 2, :rejected) }

    it "will show all the approved events" do
      expect(Event.approved).to eq approved_events
    end
  end
end
