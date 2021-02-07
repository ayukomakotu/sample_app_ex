module SessionsHelper
    # 渡されたユーザーでログインする
    def log_in(user)
        session[:user_id] = user.id
    end

    # 現在ログイン中のユーザーを返す（いる場合）
    def current_user
        #DBへの問い合わせを可能な限り小さくしたい
        if session[:user_id]
            #User.find_by(id: session[:user_id])
            # a ||= User.find...  =>  a = a or User.find...
            #左が実行されれば右も実行する　　=>  左　||　右
            @current_user ||= User.find_by(id: session[:user_id])
            #if @current_user.nil?
            #    @current_user = User.find_by(id: session[:user_id])
            #else
            #    return @current_user
            #end  の省略
        end
    end
    
    # ユーザーがログインしていればtrue、その他ならfalseを返す
    def logged_in?
        !current_user.nil?
    end
end
