require "test_helper"

class MessageInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "message interface" do
    #talk一覧
    log_in_as(@user)
    get talk_index_path(@user)
    assert_template 'talks/index'
    assert_select 'div.pagination'
  end
end
