module Navbar
  class NavbarTab < SitePrism::Section
    element :log_in,    "#log-in"
    element :sign_up,   "#sign-up"
    element :new_event, ".new-event"

    class UserDropdown < SitePrism::Section
      element :admin, "#admin"
      element :sign_out, "#sign-out"
    end

    section :user_dropdown, UserDropdown, "#user-dropdown"
  end
end
