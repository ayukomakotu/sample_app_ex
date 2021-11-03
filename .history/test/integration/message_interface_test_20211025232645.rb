require "test_helper"

class MessageInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "message interface" do
    get talk_index_path(@user)
    assert_redirect_to login_url
  end
end
