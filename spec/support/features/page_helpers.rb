module Features
  module PageHelpers
    def scroll_down
      page.execute_script "window.scrollBy(0,10000)"
    end
  end
end
