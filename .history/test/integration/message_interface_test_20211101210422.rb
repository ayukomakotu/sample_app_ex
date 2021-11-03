require "test_helper"

class MessageInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @sender = users(:michael)
    @talk = talks(:talk1)
    @receiver = users(:archer)
  end

  test "message interface talk index" do
    #talk一覧
    log_in_as(@sender)
    get talk_index_path(@sender)
    assert_select 'div.pagination'
    first_page_of_talks = @sender.talks.paginate(page: 1)
    first_page_of_talks.each do |talk|
      talk.members.each do |member|
        if member != @sender
          assert_match member.name, response.body
          assert_match talk.messages.first.content, response.body
          assert_select 'a[href=?]', talk_path(talk)
        end
      end
    end
  end

  test "message interface talk show" do
    #message一覧 talk詳細
    log_in_as(@sender)
    get talk_path(@talk)
    assert_template 'talks/show'
    assert_select 'a[href=?]', user_path(@sender)
    @talk.members.each do |member|
      if member != @sender
        assert_select 'a[href=?]', user_path(member)
      end
    end
  end

  test "message interface sent talk" do
    log_in_as(@sender)
    get user_path(@receiver)
    assert_select 'a[href]', new_message_path(@receiver)
  end

end
