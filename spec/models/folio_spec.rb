require 'spec_helper'

describe Folio do
  
  before(:each) do
    @attr = { 
      :name => "folio",
      :url => "http://google.com",
      :description => "description"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Folio.create!(@attr)
  end
  
  it "should require an title" do
    no_email_user = Folio.new(@attr.merge(:name => ""))
    no_email_user.should_not be_valid
  end
  
  # it "should accept valid email addresses" do
  #     addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
  #     addresses.each do |address|
  #       valid_email_user = User.new(@attr.merge(:email => address))
  #       valid_email_user.should be_valid
  #     end
  #   end
  #   
  #   it "should reject invalid email addresses" do
  #     addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
  #     addresses.each do |address|
  #       invalid_email_user = User.new(@attr.merge(:email => address))
  #       invalid_email_user.should_not be_valid
  #     end
  #   end
  
  it "should reject duplicate title" do
    Folio.create!(@attr)
    user_with_duplicate_email = Folio.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject title identical up to case" do
    upcased_email = @attr[:name].upcase
    Folio.create!(@attr.merge(:name => upcased_email))
    user_with_duplicate_email = Folio.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  describe "title" do

    before(:each) do
      @folio = Folio.new(@attr)
    end

    it "should have a title" do
      @folio.should respond_to(:name)
    end
    
  end
  
  # describe "password validations" do
  # 
  #   it "should require a password" do
  #     User.new(@attr.merge(:password => "", :password_confirmation => "")).
  #       should_not be_valid
  #   end
  # 
  #   it "should require a matching password confirmation" do
  #     User.new(@attr.merge(:password_confirmation => "invalid")).
  #       should_not be_valid
  #   end
  #   
  #   it "should reject short passwords" do
  #     short = "a" * 5
  #     hash = @attr.merge(:password => short, :password_confirmation => short)
  #     User.new(hash).should_not be_valid
  #   end
  #   
  # end
  
  # describe "password encryption" do
  #     
  #     before(:each) do
  #       @user = User.create!(@attr)
  #     end
  #     
  #     it "should have an encrypted password attribute" do
  #       @user.should respond_to(:encrypted_password)
  #     end
  # 
  #     it "should set the encrypted password attribute" do
  #       @user.encrypted_password.should_not be_blank
  #     end
  # 
  #   end

end