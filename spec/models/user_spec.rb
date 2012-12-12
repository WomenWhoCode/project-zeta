require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }

  it "should require a username" do
    user.name = ""
    user.should_not be_valid
  end

end
