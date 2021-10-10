require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @talk = talks(:talk1)
    @message = Message.new(user_id: @user.id, 
                           talk_id: @talk.id, 
                           content: "test")
  end

  test "should be valid?" do
    assert @message.valid?
  end

  test "user_id should be present" do
    @message.user_id = nil
    assert_not @message.valid?
  end

  test "talk_id should be present" do
    @message.talk_id = nil
    assert_not @message.valid?
  end

  test "content should be blank" do
    @message.content = "    "
    assert_not @message.valid?
  end

  test "content should be too long" do
    @message.content = "a"*141
    assert_not @message.valid?
  end
end
