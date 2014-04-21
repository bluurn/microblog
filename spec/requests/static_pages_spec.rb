require 'spec_helper'

describe "Static Pages" do

  describe "Home Page" do

    it "Should have content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it "Should have title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title('Home')
    end
  end

  describe "Help page" do

    it "Should have content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "Should have title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title('Help')
    end
  end

  describe "About page" do

    it "Should have content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end

    it "Should have title 'About'" do
      visit '/static_pages/about'
      expect(page).to have_title('About')
    end
  end

  describe "Contacts page" do

    it "Should have content 'Contacts'" do
      visit '/static_pages/contacts'
      expect(page).to have_content('Contacts')    
    end

    it "Should have title 'Contacts'" do
      visit '/static_pages/contacts'
      expect(page).to have_title('Contacts')
    end
  end

end
