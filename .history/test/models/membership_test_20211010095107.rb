require "test_helper"

class MembershipTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @talk = talks(:talk1)
    @membership = Membership.new(user_id: @user.id,
                                  talk_id: @talk.id)
  end

  test "should be valid?" do
    assert @membership.valid?
  end

  test "user_id should be presence" do
    @membership.user_id = nil
    assert_not @membership.valid?
  end

  test "talk_id should be presence" do
    @membership.talk_id = nil
    assert_not @membership.valid?
  end
 end
