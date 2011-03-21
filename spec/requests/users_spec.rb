require 'spec_helper'

describe "Users" do
  #describe "GET /users" do
   # it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    #  get users_index_path
     # response.status.should be(200)
    #end
    describe "signup" do
    
    describe "success" do
      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "Name", :with => "Example User"
          fill_in "Email", :with => "foobar@example.com"
          fill_in "Password", :with => "example"
          fill_in "Confirm Password", :with => "example"
          click_button
          response.should have_selector("div.flash.success", :content => "Welcome")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
      
    describe "signin/signout" do  
      
      describe "failure" do
      
        it "should not make a new user" do
          lambda do
          visit signup_path
          fill_in "Name", :with => ""
          fill_in "Email", :with => ""
          fill_in "Password", :with => ""
          fill_in "Confirm Password", :with => ""
          click_button
          response.should render_template('users/new')
          response.should have_selector('div#error_explanation')
          end.should_not change(User, :count)
        end
        
      describe "success" do
        
        it "should sign a user in and out" do
          user = Factory(:user)
          visit signin_path
          fill_in :email, :with => user.email
          fill_in :password, :with => user.password
          click_button
          controller.should be_signed_in
          click_link "Sign out"
          controller.should_not be_signed_in
          end
        end
      end
    end
  end
end
end

