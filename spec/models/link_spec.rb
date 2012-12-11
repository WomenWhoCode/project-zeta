require 'spec_helper'

describe Link do
  
  it "should have a valid factory" do
    FactoryGirl.build(:link).should be_valid
  end
  
  it "should require a url" do
    FactoryGirl.build(:link, :url => "").should_not be_valid
  end

  describe "has access to user" do
    before do
      user = User.new(name: "test user")
      @link = Link.new(title: "new link", url: "link.com", description: "this is a link", user: user)
    end
  
    subject { @link }
    
    it {should respond_to(:user) }
  end
  
end
