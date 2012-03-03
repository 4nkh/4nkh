require 'spec_helper'
describe PagesController do

  describe "GET 'show'" do
    
    it "should be successful" do
      get :show, :page => 'seo'
      response.should be_success
    end
    
    it "should be successful" do
      get :show, :page => 'business'
      response.should be_success
    end
    
    it "should be successful" do
      get :show, :page => 'hosting'
      response.should be_success
    end
    
  end
  
  describe "GET 'realisation'" do
    
    it "should be successful" do
      get :realisation
      response.should be_success
    end
    
  end 
  
  describe "GET 'mobile'" do

    it "should be successful" do
      get :mobile
      response.should be_success
    end

  end

  describe "GET 'tools'" do

    it "should be successful" do
      get :tools
      response.should be_success
    end

  end

end
