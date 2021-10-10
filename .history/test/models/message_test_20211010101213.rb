require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def setup
    @message = messages(:message1)
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
end
