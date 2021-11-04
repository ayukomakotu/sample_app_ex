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
    get talks_user_path(@sender)
    assert_select 'div.pagination'
    first_page_of_talks = @sender.talks.paginate(page: 1)
    first_page_of_talks.each do |talk|
      debugger
      assert_match talk.messages.first.content, response.body
      talk.members.each do |member|
        if member != @sender
          assert_match member.name, response.body
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
    #非ログイン時送信
    assert_no_difference 'Message.count' do
      post messages_path, params: { message: {content: "test message",
                                              talk_id: @talk.id,
                                              user_id: @sender.id}}
    end
    #ログイン時
    log_in_as(@sender)
    get user_path(@receiver)
    get talk_path(@talk)
    assert_template 'talks/show'
    assert_select 'a[href=?]', user_path(@receiver)
    assert_select 'a[href=?]', user_path(@sender)
    @talk.messages.each do |message|
      assert_match message.content, response.body
    end
    assert_select 'input[type=file]'
   
    #無効な送信
    assert_no_difference 'Message.count' do
      post messages_path, params: {message: { content: "   ",
                                              talk_id: @talk.id,
                                              user_id: @sender.id}}
    end
    assert_select 'div#error_explanation'
    #有効な送信
    assert_difference 'Message.count', 1 do
      post messages_path, params: { message: { content: "testmessage",
                                               talk_id: @talk.id,
                                               user_id: @sender.id}}
    end
    assert_not flash.empty?
    
  end
end
