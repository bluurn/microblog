require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "SignIn page" do
    it { should have_content('Sign In') }
    it { should have_title('Sign In') }
  end

end
