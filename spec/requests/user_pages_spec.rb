require 'spec_helper'

describe "User pages" do
    
  subject { page }
  
   describe "signup page" do
     before  { visit signup_path } 
      
     it { should have_selector('h1',  text: 'Sign up') } 
     it { should have_selector('title', text: full_title('Sign up')) }
  end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',     text: user.name) }
    it { should have_selector('title',  text: user.name) }
    it { should have_selector('p',      text: user.email) }
    it { should have_selector('p',      text: user.about_text) }
  end
  
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create account!" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      let(:name) {"Example User"}
      before do
        fill_in "Name",         with: name
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe "after saving the user" do
        #puts body
        it { should have_selector('h1',  text: name) }
        it { should have_link('Sign out') }
      end
    end
  end
  
  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in(user)
      visit edit_user_path(user)
    end
    
    describe "page" do
      it { should have_selector('h1',    text: "Update your profile") }
      it { should have_selector('title', text: "Edit user:") }
    end

    describe "with invalid information" do
      before { click_button "Save changes!" }

      it { should have_content('Invalid password') }
    end
    
    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      let(:new_about_text)  {"Changed about text!"}
 
      before do
        puts user.id
        fill_in "Name",         with: new_name
        fill_in "Email",        with: new_email
        fill_in "Password",     with: user.password
        fill_in "About text",     with: new_about_text     
        click_button "Save changes!"
      end
      
      it { should have_selector('title', text: new_name) }
      it { should have_selector('div.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { user.reload.name.should  == new_name }
      specify { user.reload.email.should == new_email }
      specify { user.reload.about_text.should == new_about_text }
    end
    
  end
end