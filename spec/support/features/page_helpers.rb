module Features
  module PageHelpers
    def scroll_down
      page.execute_script "window.scrollBy(0,10000)"
    end

    def sign_in user
      home_page = HomePage.new
      debugger
      home_page.navbar.log_in.click
      click_on "LOG IN"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Log in"
    end
  end
end
