class Event < ApplicationRecord
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

  has_attached_file :image
  validates_attachment_content_type :image, content_type: VALID_IMAGE_CONTENT_TYPE

  has_attached_file :register_form
  validates_attachment_content_type :register_form, content_type: VALID_REGISTER_FORM_CONTENT_TYPE
end
