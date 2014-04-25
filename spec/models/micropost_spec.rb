require 'spec_helper'

describe Micropost do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @micropost = user.microposts.build(content: 'Lorem ipsum')
  end
  subject { @micropost } 
  
  it { should respond_to(:content) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  it { should be_valid }

  describe "when user is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end
  describe "with empty content" do
    before { @micropost.content = '' }
    it { should_not be_valid }
  end
  describe "with content longer than 140 symbols" do
    before { @micropost.content = 'a' * 141 }
    it { should_not be_valid}
  end
end
