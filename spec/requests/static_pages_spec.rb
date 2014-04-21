require 'spec_helper'

describe "Static Pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  describe "Home Page" do

    it "Should have content 'Sample App'" do
      visit root_path
      expect(page).to have_content('Sample App')
    end

    it "should have the base title" do
      visit root_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

    it "should not have a custom page title" do
      visit root_path
      expect(page).not_to have_title('| Home')
    end
  end

  describe "Help page" do

    it "Should have content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "Should have title 'Help'" do
      visit help_path
      expect(page).to have_title("#{base_title} | Help")
    end
  end

  describe "About page" do

    it "Should have content 'About'" do
      visit about_path
      expect(page).to have_content('About')
    end

    it "Should have title 'About'" do
      visit about_path
      expect(page).to have_title("#{base_title} | About")
    end
  end

  describe "Contact page" do

    it "Should have content 'Contact'" do
      visit contact_path
      expect(page).to have_content  ('Contacts')    
    end

    it "Should have title 'Contact'" do
      visit contact_path
      expect(page).to have_title("#{base_title} | Contact")
    end
  end

end
