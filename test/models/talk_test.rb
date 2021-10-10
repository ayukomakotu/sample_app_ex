require "test_helper"

class TalkTest < ActiveSupport::TestCase
  def setup
    @talk = Talk.new
  end

  test "should be valid?" do
    assert @talk.valid?
  end
end
