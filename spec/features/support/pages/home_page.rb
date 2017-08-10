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
