require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "SignIn page" do
    before { visit signin_path }

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }

    describe "with invalid information" do
      before { click_button "Sign in"}

      it { should have_title('Sign in') }
      it { should have_selector('div.alert.alert-error') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_title(user.name)}
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Settings', href: edit_user_path(user))}
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end

    describe "authorization" do
      describe "for non-signed-in users" do
        let(:user) { FactoryGirl.create(:user) }

        describe "in the Users controller" do
          describe "visiting the edit page" do
            before { visit edit_user_path(user) }
            it {should have_title('Sign in')}
          end
          describe "submitting an update action" do
            before { patch user_path(user) }
            specify { expect(response).to redirect_to(signin_path) }
          end
        end
      end

      describe "as wrong user" do
        let(:user) { FactoryGirl.create(:user) }
        let(:wrong_user) { FactoryGirl.create(:user, email: 'wrong@example.com') }
        before { sign_in user }
        
        describe "submitting get request to Users#edit action" do
          before { get edit_user_path(wrong_user) }
          specify { expect(response.body).not_to match('Edit user') }
          specify { expect(response).to be_redirect }
        end

        describe "submitting patch request to Users#update action" do
          before { patch user_path(wrong_user) }          
          specify { expect(response).to be_redirect  }
        end

      end
    end
  end

end
