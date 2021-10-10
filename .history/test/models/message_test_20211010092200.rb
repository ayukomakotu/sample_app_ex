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
end
