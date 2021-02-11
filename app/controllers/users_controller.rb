class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  # POST /users (+ params)
  def create
    
    # (@user + given params).save
    @user = User.create(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Sample App!"
      redirect_to @user 
      # redirect_to user_path(@user)
      # redirect_to user_path(@user.id) 
      # redirect_to user_path(1) => /users/1 
      # GET "users/#{@user.id}"
    else
      render 'new'
    end
  end
  


  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end

