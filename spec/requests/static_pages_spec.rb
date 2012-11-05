require 'spec_helper'

describe "StaticPages" do

   subject { page }

   describe "Home page" do
      before { visit root_path }

      it { should have_selector('title', text: full_title('WomenWhoCode')) }
      
      it { should have_selector('h1', text: 'Hello Ruby Tuesdays!') }

      it { should have_content('by Women Who Code') }

   end


end
