require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:michael)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.name,               mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI.escape(user.email),  mail.body.encoded
  end

  test "password_reset" do
    user = users(:michael)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    
    assert_equal "Password reset", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.reset_token,        mail.body.encoded
    assert_match CGI.escape(user.email),  mail.body.encoded
  end

  test "more_followers" do
    user = users(:michael)
    follower = users(:archer)
    mail = UserMailer.more_followers(user, follower)
    assert_equal "More followers",             mail.subject
    assert_equal [user.email],                 mail.to
    assert_equal ["noreply@example.com"],      mail.from
    assert_match follower.name,                mail.body.encoded
    assert_match "users/#{user.id}/followers", mail.body.encoded
  end
end
