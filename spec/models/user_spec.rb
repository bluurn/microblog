require 'spec_helper'

describe User do

  before { @user = User.new name: "Vladimir Suvorov", email: "bluurn@gmail.com" }
  subject { @user } 

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = '' }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = '' }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = 'a' * 51 }
    it { should_not be_valid }
  end

  describe "when email format should be valid" do
    it "should be valid" do

      addresses = %w[some@company,com company.com some@company+sample.com]

      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid       
      end
    end
  end

  describe "when email format should not be valid" do
    it "should not be valid" do
      addresses = %w[bluurn@gmail.com bluurn2@gmail.com]

      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid 
      end
    end
  end

  describe "when an email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email.upcase!
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end
end