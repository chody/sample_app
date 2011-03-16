class UsersController < ApplicationController
  def new
    @title = "Sign up"
    @user = User.new
  end # end of def new
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end #end of def show
  
  def create
    @user = User.new(params[:user])
    if @user.save
      
      #handle a successful save
      flash[:success] = "Welcome to NOTwitter!"
      redirect_to @user
    else
      #render errors and title screen
      @title = "Sign up"
      render 'new'
    end #end of if
  end # End of Def Create
  
end  #End of Controller
