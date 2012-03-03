require 'spec_helper'
describe FoliosController do

  before (:each) do
    @user = Factory(:user)
    sign_in @user
  end

  describe "GET 'index'" do
    
    it "should be successful" do
      get :index
      response.should be_success
    end
  
  end
  
  describe "GET 'new'" do
     
    it "should be successful" do
      get :new, :id => @user.id
      response.should be_success
    end
  
  end
  
  describe "POST 'create'" do
    
    @folio = Factory(:folio)    
        
    it "should be successful" do
      post :create, :folio => @folio
      response.should be_success
    end
    
  end
  
  describe "PUT 'update'" do
     
    @folio = Factory(:folio)  
                 
    it "should be successful" do
      put :update, :id => @folio.id
      response.should be_success
    end
    
  end
end  