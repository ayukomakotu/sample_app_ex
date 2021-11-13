require "test_helper"

class UserSearchTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @searched = users(:archer)
  end

  test "invalid user search" do
    get users_path
    get search_users_path, params: {search: {name: @searched.name}}
    assert_template 'users/search'
    assert_match @searched.name, response.body
  end
end
