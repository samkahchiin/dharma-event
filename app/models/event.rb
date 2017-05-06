class Event < ApplicationRecord
  scope :approved, -> { where(status: "approved") }

  include AASM
  aasm column: "status" do
    state :pending, initial: true
    state :approved, :rejected

    event :approve do
      transitions from: :pending, to: :approved
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end
  end

  STATUS = [
    "pending",
    "approved",
    "rejected"
  ]

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
  ]
  LANGUAGE = [ "Mandarin" , "English" ]
  VALID_IMAGE_CONTENT_TYPE = [
    "image/jpg",
    "image/jpeg",
    "image/png",
    "image/gif"
  ]

  VALID_REGISTER_FORM_CONTENT_TYPE = [
    "application/pdf",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    "application/msword"
  ]

  has_attached_file :image, styles: {
    thumb: "268x380#"
  }, default_style: :thumb, s3_protocol: 'https'
  validates_attachment_content_type :image, content_type: VALID_IMAGE_CONTENT_TYPE

  has_attached_file :register_form
  validates_attachment_content_type :register_form, content_type: VALID_REGISTER_FORM_CONTENT_TYPE

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
