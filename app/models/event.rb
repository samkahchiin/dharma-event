class Event < ApplicationRecord
  belongs_to :user
  has_many :prices
  accepts_nested_attributes_for :prices,
    reject_if: :all_blank,
    allow_destroy: true

  scope :approved, -> { where(status: "approved") }

  STATUS = [
    "pending",
    "approved",
    "rejected"
  ].freeze

  AREA = [
    "Johor",
    "Kedah",
    "Kelantan",
    "Kuala Lumpur",
    "Labuan",
    "Malacca",
    "Negeri Sembilan",
    "Pahang",
    "Penang",
    "Perak",
    "Perlis",
    "Sabah",
    "Sarawak",
    "Selangor",
    "Singapore",
    "Terengganu"
  ].freeze

  LANGUAGE = [ "Mandarin" , "English" ].freeze

  validates :status, inclusion: STATUS
  validates :area, inclusion: AREA
  validates :language, inclusion: LANGUAGE
  validates :title, :start_time, :end_time,
    :speaker, :description, :contact, :location,
    :organizer_name, :area, :language, :status, presence: true

  VALID_IMAGE_CONTENT_TYPE = [
    "image/jpg",
    "image/jpeg",
    "image/png",
    "image/gif"
  ].freeze

  VALID_REGISTER_FORM_CONTENT_TYPE = [
    "application/pdf",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    "application/msword"
  ].freeze

  has_attached_file :image, styles: {
    thumb: "268x380#"
  }, default_style: :thumb, s3_protocol: 'https', default_url: "missing.jpeg"
  validates_attachment_content_type :image, content_type: VALID_IMAGE_CONTENT_TYPE

  has_attached_file :register_form, default_url: "missing.jpeg"
  validates_attachment_content_type :register_form, content_type: VALID_REGISTER_FORM_CONTENT_TYPE


  include AASM
  aasm column: "status" do
    state :pending, initial: true
    state :approved, :rejected

    event :approve do
      transitions from: :pending, to: :approved
      transitions from: :rejected, to: :approved
    end

    event :reject do
      transitions from: :pending, to: :rejected
      transitions from: :approved, to: :rejected
    end
  end


  def approved?
    status == "approved"
  end

  def rejected?
    status == "rejected"
  end

  def pending?
    status == "pending"
  end
end
