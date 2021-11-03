require "test_helper"

class MessageInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "message interface" do
    #非ログインユーザーはログインurlに飛ばされる
    get talk_index_path(@user)
    assert_redirected_to login_url
    log_in_as(@user)
    get talk_index_path(@user)
    assert_template 'talks/index'
  end
end
