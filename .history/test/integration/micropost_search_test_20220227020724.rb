require "test_helper"

class MicropostSearchTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other = users(:archer)
    @micropost = microposts(:orange)
  end

  test "search micropost in feed" do
    log_in_as(@user)
    get root_path
    assert_select "input[value=search feed]"
    get root_path, params: {search: {content: @micropost.content}}
    assert_template 'static_pages/home'
    #完全一致
    assert_match @micropost.content, response.body
    assert_match @micropost.user.name, response.body
    #部分一致
    get root_path
    get root_path, params: {search: {content: "orange"}}
    assert_template 'static_pages/home'
    assert_match @micropost.content, response.body
    assert_match @micropost.user.name, response.body
  end

  test "search micropost in user" do
    log_in_as(@other)
    get user_path(@user)
    assert_select "form", 3
    get user_path(@user), params: {search: {content: @micropost.content}}
    assert_template 'users/show'
    #完全一致
    assert_match @micropost.content, response.body
    assert_match @micropost.user.name, response.body
    #部分一致
    get user_path(@user)
    get user_path(@user), params: {search: {content: "orange"}}
    assert_match @micropost.content, response.body
    assert_match @micropost.user.name, response.body
  end
end
