require_relative "navbar"

class Page < SitePrism::Page
  include Navbar
  element :navbar, NavbarTab, ".navbar"
end
