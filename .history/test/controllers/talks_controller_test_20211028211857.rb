require "test_helper"

class TalksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "should redirect index non logged in" do
    get talk_index_path(@user)
    assert_redirected_to login_url
    log_in_as(@user)
    get talk_index_path(@user)
    assert_template 'talks/index'
  end
end
