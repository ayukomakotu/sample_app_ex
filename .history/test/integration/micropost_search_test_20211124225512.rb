require "test_helper"

class MicropostSearchTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @micropost = microposts(:orange)
  end

  test "search micropost in feed" do
    log_in_as(@user)
    get root_path
    assert_select "form", 2
    get root_path, params: {search: {content: @micropost.content}}
    assert_template 'static_pages/home'
    assert_match @micropost.content, response.body
  end
end
