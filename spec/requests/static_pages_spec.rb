require 'spec_helper'

describe "Static Pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home Page" do
    before { visit root_path}

    it "Should have content 'Sample App'" do
      expect(page).to have_content('Sample App')
    end

    it "should have the base title" do
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

    it "should not have a custom page title" do
      expect(page).not_to have_title('| Home')
    end
  end

  describe "Help page" do
    before { visit help_path }

    it "Should have content 'Help'" do
      expect(page).to have_content('Help')
    end

    it "Should have title 'Help'" do
      expect(page).to have_title("#{base_title} | Help")
    end
  end

  describe "About page" do
    before { visit about_path }

    it "Should have content 'About'" do
      expect(page).to have_content('About')
    end

    it "Should have title 'About'" do
      expect(page).to have_title("#{base_title} | About")
    end
  end

  describe "Contact page" do
    before { visit contact_path }

    it "Should have content 'Contact'" do
      expect(page).to have_content  ('Contacts')
    end

    it "Should have title 'Contact'" do
      expect(page).to have_title("#{base_title} | Contact")
    end
  end

end
