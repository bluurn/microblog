require 'spec_helper'

describe "Static Pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home Page" do
    subject { page }
    before { visit root_path }

    it { should have_content('Sample App') }
    it { should have_title("Ruby on Rails Tutorial Sample App") }
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    subject { page }
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title("#{base_title} | Help")}
  end

  describe "About page" do
    subject { page }
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title("#{base_title} | About")}
  end

  describe "Contact page" do
    subject { page }
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title("#{base_title} | Contact")}
  end

end
