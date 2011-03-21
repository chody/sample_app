require 'spec_helper'

describe SessionsController do
render_views 


  describe "GET 'new'" do
    
    it "should be successful" do
      get :new
      response.should be_success
    end # end of should be successful
    
  it "should have the right title" do
    get :new
    response.should have_selector('title', :content => "Sign in")
    end # end of title
  
 
   describe "POST 'create'" do
    
    describe "invalid signin" do
      
      before(:each) do 
        @attr = { :email => "email@example.com", :password => "invalid" }
    end # end invalid signin
    
    it "should re-render the new page" do
      post :create, :session => @attr
      response.should render_template('new')
    end # end of should re render new page
    
    it "should have the right title" do
    post :create, :session => @attr
    response.should have_selector('title', :content => "Sign in")
  end # end of should have right title
  
  it "should have flash message" do
    post :create, :session => @attr
    flash.now[:error].should =~ /invalid/i
    
    describe "with valid email and password" do
      
      before(:each) do 
        @user = Factory(:user)
        @attr = { :email => @user.email, :password => @user.password }
      end  # end of before
      
      it "should sign the user in" do
       post :create, :session => @attr
        controller.current_user.should == @user
        controller.should be_signed_in
        # Fill in with tests for a signed-in user.
      end # end of signed in user
      
      it "should redirect to the user show page" do
        post :create, :session => @attr
        response.should redirect_to(user_path(@user))
      end #redirect to user path
      
      describe "DELETE 'destroy'" do
        
        it "should sign a user out" do
          test_sign_in(Factory(:user))
          delete :destroy
          controller.should_not be_signed_in
          response.should redirect_to(root_path)
        end
      end
      
      
        
        end # end of should have flash message
      end # end of describe post create
    end # end of Sessions Controller
  end # end of describe get new
end
end
 