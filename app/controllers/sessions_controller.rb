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
    if user && user.authenticate(params[:session][:password])
      #if @user は　if not @user.nill?と同じ意味　nillガード
      #Success
      #log_in(@user)
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
    else
      #Failure
      # alert-danger  =>赤色のフラッシュ
      flash.now[:danger] = 'invalid email/password conbination' 
      render 'new'
      

    end
  end

  def destroy
  end
end
