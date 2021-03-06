require "test_helper"

class UserSearchTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @searched = users(:archer)
    @other_searched = users(:jason)
  end

  test "invalid user search" do
    log_in_as(@user)
    #nameが空白
    get users_path
    get search_users_path, params: {search: {name: "   "}}
    assert_template 'users/index'
    #idが空白
    get users_path
    get search_users_path, params: {search: {id: "  "}}
    assert_template 'users/index'
    #存在しないユーザー
    get users_path
    get search_users_path, params: {search: {name: "nobody"}}
    assert_template 'users/search'
    assert_match "User not found", response.body
    get users_path
    get search_users_path, params: {search: {id: 0}}
    assert_template 'users/search'
    assert_match "User not found", response.body
  end
  
  test "user search for name" do
    log_in_as(@user)
    get users_path
    get search_users_path, params: {search: {name: @searched.name}} #完全一致
    assert_template 'users/search'
    assert_match @searched.name, response.body 
    get users_path
    get search_users_path, params: {search: {name: "Archer"}} #部分一致
    assert_template 'users/search'
    assert_match @searched.name, response.body
    assert_match @other_searched.name, response.body
  end

  test "user search for id" do
    log_in_as(@user)
    get users_path
    get search_users_path, params: {search: {id: @searched.id}}
    assert_template 'users/search'
    assert_match @searched.name, response.body
  end
end
