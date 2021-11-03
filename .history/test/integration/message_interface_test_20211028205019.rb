require "test_helper"

class MessageInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @talk = talks(:talk1)
  end

  test "message interface talk index" do
    #talk一覧
    log_in_as(@user)
    get talk_index_path(@user)
    assert_template 'talks/index'
    assert_select 'div.pagination'
    first_page_of_talks = @user.talks.paginate(page: 1)
    first_page_of_talks.each do |talk|
      talk.members.each do |member|
        if member != @user
          assert_match member.name, response.body
          assert_match talk.messages.first.content, response.body
          assert_select 'a[href=?]', talk_path(talk)
        end
      end
    end

    test "message interface talk show"
    #message一覧 talk詳細
    get talk_path(@talk)
    assert_template 'talks/show'

  end
end
