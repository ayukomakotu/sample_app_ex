require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end
  test "should be redirect new" do
    get new_message_path(@user)
    assert_redirected_to login_url
  end
  
end
