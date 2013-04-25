require 'spec_helper'

describe Link do
  before(:all) do
    Link.delete_all
    User.delete_all
  end
  
  let(:user) { create(:user) }
  let(:link) { create(:link, :user => user) }
  
  describe "validation" do
    it "should have a valid factory" do
      link.should be_valid
    end
    
    context "#url" do
      it "should require a url" do
        link.url = ""
        link.should_not be_valid
      end
    end
    
    context "#title" do
      it "should require a title" do
        link.title = nil
        link.should_not be_valid
      end
    end
  end
  
  describe "relations" do
    
    context "#user" do
      
      subject { link }
  
      it {should respond_to(:user) }
      
      it "should be equal to the link user" do
        link.user.should == user
      end

    end
    
  end
  
  describe "the before save method handles http protocals" do
        
    it "should add 'http' if it doesn't exist" do
      link.url = "new_google.com"
      link.save
      link.url.should eq "http://new_google.com"
    end
    
    it "shouldn't add 'http' if it does exist" do
      link.url = "http://new_google.com"
      link.save
      link.url.should eq "http://new_google.com"
    end
  end
end
