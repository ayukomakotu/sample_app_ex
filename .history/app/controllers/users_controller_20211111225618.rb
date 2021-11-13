class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers, :talks]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy


  #GET /users
  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    redirect_to root_url and return unless @user.activated?
    @talk = Talk.new
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  
  # POST /users (+ params)
  def create
    @user = User.create(user_params)
    #チェックボックスによって通知のオンオフを切り替える
    params[:user][:follow_notify] == "1" ? @user.follow_notify = true : @user.follow_notify = false
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
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
    #チェックボックスによって通知のオンオフを切り替える
    params[:user][:follow_notify] == "1" ? @user.follow_notify = true : @user.follow_notify = false
    if @user.update(user_params)
      # 更新に成功した場合を扱う。
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  #DELETE /user/:id
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def talks
    @talks = current_user.talks.paginate(page: params[:page])
  end

  def search
    @search_result = User.where(name = params[:search])
  end


  private
      def user_params
        params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation,)
      end

      def search_params
        params.require.permit(:search)
      end

      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
      end

      def admin_user
        redirect_to(root_url) unless current_user.admin?
      end

      
end

