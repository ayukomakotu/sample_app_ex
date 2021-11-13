require "test_helper"

class UserSearchTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @searched = users(:archer)
  end

  test "invalid user search" do
    get users_path
    post search_users_path, params: {search: {name: }}
  end
end
