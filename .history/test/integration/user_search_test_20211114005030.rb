require "test_helper"

class UserSearchTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "user_search_interface" do
    get users_path
    assert_select 'input[type=file]'
  end
end
