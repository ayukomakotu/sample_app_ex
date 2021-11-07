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
end
