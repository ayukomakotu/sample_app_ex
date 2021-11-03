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
    first_page_of_talks = @user.talks.paginate(page: 1)
    first_page_of_talks.each do |talk|
      talk.members.each do |member|
        if member != @user
          sender = member
          assert_match gravatar_for(sender), response.body
        end
      end
    end
  end
end
