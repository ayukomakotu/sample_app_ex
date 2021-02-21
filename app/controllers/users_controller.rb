class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]


  #GET /users
  def index
    @users = User.all
  end
  
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
  
  # GET  /users/:id/edit
  def edit
    @user = User.find(params[:id])
    # => app/views/users/edit.html.erb
  end


  #PATCH /users/
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 更新に成功した場合を扱う。
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # beforeアクション

  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end

