require "test_helper"

class TalkTest < ActiveSupport::TestCase
  def setup
    @talk = Talk.new
  end

  test "should be valid?" do
    assert @talk.valid?
  end

  #test "order should be most recent first" do
   # assert_equal talks(:most_recent), Talk.firs
  #end
end
