require "test_helper"

class MicropostSearchTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "search micropost in feed" do
    log_in_as(@user)
    get root_path
    assert_select "form imput", 2 
  end
end