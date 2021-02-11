class SessionsController < ApplicationController
  #GET /login
  def new
    # 使えない @session = Session.new
    # 使える　 scope: :session + url: login_path
  end

  # POST /login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #nillガード
    if user&.authenticate(params[:session][:password])
      #if @user は　if not @user.nill?と同じ意味　nillガード
      #Success
      log_in user
      #userのsessionを永続的に保持する　
      remember user
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      redirect_to user
    else
      #Failure
      # alert-danger  =>赤色のフラッシュ
      flash.now[:danger] = 'invalid email/password conbination' 
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
