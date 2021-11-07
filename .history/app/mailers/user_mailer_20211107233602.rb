class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end
  # => return: mail object(text/html)
  # example: mail.deliverも可能

  
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

  def more_followers(user, follower) #<= 引数を追加してfollowrの情報を扱える様にした
    @user = user
    @follower = follower　# followしたuserの情報をメール内で扱うため
    mail to: user.email, subject: "More followers"
  end
end
