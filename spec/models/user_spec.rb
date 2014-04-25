require 'spec_helper'

describe User do

  before do
   @user = User.new name: "Vladimir Suvorov", 
                            email: "bluurn@gmail.com",
                            password: "foobar",
                            password_confirmation: "foobar" 
  end
  subject { @user } 

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }
  it { should respond_to(:microposts) }
  
  it { should be_valid }
  it { should_not be_admin }

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

  describe "when password is empty" do
    before do
     @user = User.new name: "Vladimir Suvorov", 
                              email: "bluurn@gmail.com",
                              password: "",
                              password_confirmation: ""      
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that is too short" do
    before { @user.password = @user.password_confirmation = 'a' * 5 }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by email: @user.email }

    describe "with a valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate('invalid') } 
      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

  describe "with admin attribute set to true" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end
    
    it { should be_admin }
  end
end