require 'spec_helper'

describe "Static Pages" do

  describe "Home Page" do

    it "Should have content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it "Should have title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title('Ruby on Rails Tutorial Sample App | Home')
    end
  end

  describe "Help page" do

    it "Should have content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "Should have title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title('Ruby on Rails Tutorial Sample App | Help')
    end
  end

  describe "About page" do
    it "Should have content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end
  end

end
