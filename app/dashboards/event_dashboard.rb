require "administrate/base_dashboard"

class EventDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    start_time: Field::DateTime,
    end_time: Field::DateTime,
    speaker: Field::String,
    description: Field::Text,
    contact: Field::String,
    location: Field::String,
    price: Field::Number,
    image: Field::Paperclip,
    organizer_name: Field::String,
    area: Field::Select.with_options(collection: Event::AREA),
    language: Field::Select.with_options(collection: Event::LANGUAGE),
    register_link: Field::String,
    register_form: Field::Paperclip,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :title,
    :start_time,
    :end_time,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :title,
    :start_time,
    :end_time,
    :speaker,
    :description,
    :contact,
    :location,
    :price,
    :created_at,
    :updated_at,
    :image,
    :organizer_name,
    :area,
    :language,
    :register_link,
    :register_form,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :start_time,
    :end_time,
    :speaker,
    :description,
    :contact,
    :location,
    :price,
    :image,
    :organizer_name,
    :area,
    :language,
    :register_link,
    :register_form,
  ].freeze

  # Overwrite this method to customize how events are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(event)
  #   "Event ##{event.id}"
  # end
end
