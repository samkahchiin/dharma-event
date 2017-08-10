class HomePage < SitePrism::Page
  element :start_date_filter, "#start-date-filter"
  element :end_date_filter, "#end-date-filter"

  class Event < SitePrism::Section
    element :title, ".title"
    element :start_time, ".start-time"
    element :location, ".location"
  end

  sections :events, Event, ".event-card"
end

class EventShowPage < SitePrism::Page
  element :title, "#title"
  element :organizer, "#organizer"
  element :description, "#description"
  element :speaker, "#speaker"
  element :language, "#language"
  element :contact, "#contact"
  element :area, "#area"
  element :start_time, ".general-content-row .start-time"
  element :detailed_start_time, ".detailed-content-row .start-time"
  element :detailed_end_time, ".end-time"

  class Price < SitePrism::Section
    element :amount, ".amount"
    element :price_type, ".price-type"
  end

  sections :prices, Price, ".price"
end
