require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @talk = talks(:talk1)
  end
  test "should be redirect new" do
    get new_message_path(@user)
    assert_redirected_to login_url
  end

  test "should be reditrect create" do
    post params: {message: {content: "test",
                            talk_id: @talk.id,
                            user_id: @user.id}}
    assert_redirected_to login_url
  end
  
end
