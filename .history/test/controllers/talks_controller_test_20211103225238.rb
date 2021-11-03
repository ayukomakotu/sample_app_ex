require "test_helper"

class TalksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @talk = talks(:talk1)
  end

  #talk一覧
  test "should redirect index" do
    get talks_user_path(@user)
    assert_redirected_to login_url
    log_in_as(@user)
    get talks_user_path(@user)
    assert_template 'talks/index'
  end

  #talk詳細message一覧
  test "should redirect show" do
    get talk_path(@talk)
    assert_redirected_to login_url
    log_in_as(@user)
    get talk_path(@talk)
    assert_template 'talks/show'
  end
end
