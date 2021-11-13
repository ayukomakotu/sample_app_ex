require "test_helper"

class UserSearchTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "user_search_interface" do
    get users_path
  end
end
