require "rails_helper"

RSpec.describe Event, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:prices) }
  it { is_expected.to accept_nested_attributes_for(:prices).allow_destroy(true) }
  it { is_expected.to validate_inclusion_of(:status).in_array(Event::STATUSES.values) }
  it { is_expected.to validate_inclusion_of(:area).in_array(Event::AREAS) }
  it { is_expected.to validate_inclusion_of(:language).in_array(Event::LANGUAGES.values) }

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

  let!(:pending_events)  { create_list(:event, 2) }
  let!(:approved_events) { create_list(:event, 2, :approved) }
  let!(:rejected_events) { create_list(:event, 2, :rejected) }

  describe "approve" do
    it "will show all the approved events" do
      expect(Event.approved).to eq approved_events
    end
  end

  describe "approved?" do
    it "will show true when the event is approved" do
      expect(approved_events.first.approved?).to eq true
    end

    it "will show false when the event is not approved" do
      expect(pending_events.first.approved?).to eq false
      expect(rejected_events.first.approved?).to eq false
    end
  end

  describe "rejected?" do
    it "will show true when the event is rejected" do
      expect(rejected_events.first.rejected?).to eq true
    end

    it "will show false when the event is not rejected" do
      expect(pending_events.first.rejected?).to eq false
      expect(approved_events.first.rejected?).to eq false
    end
  end

  describe "pending?" do
    it "will show true when the event is pending" do
      expect(pending_events.first.pending?).to eq true
    end

    it "will show false when the event is not pending" do
      expect(rejected_events.first.pending?).to eq false
      expect(approved_events.first.pending?).to eq false
    end
  end
end
