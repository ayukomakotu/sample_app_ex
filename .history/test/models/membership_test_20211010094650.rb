require "test_helper"

class MembershipTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @talk = talks(:talk1)
    @memberships = Membership.new(user_id: @user.id,
                                  talk_id: @talk.id)
  end
end
