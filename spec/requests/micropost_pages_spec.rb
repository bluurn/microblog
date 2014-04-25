require 'spec_helper'

describe "MicropostPages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }

  describe "micropost creation" do
  	before do
  		sign_in user
  		visit root_path
  	end

    describe "with invalid information" do
      it "should not create micropost" do
        expect { click_button "Post" }.not_to change(Micropost, :count)  
      end

      describe "error messages" do
        before { click_button "Post"}
        it { should have_content 'error' }
      end
    end

    describe "with valid information" do
      before { fill_in 'micropost_content', with: "Lorem Ipsum" }

      it "should create micropost" do
        expect { click_button "Post" }.to change(Micropost, :count).by(1)  
      end
    end
  end
end
