require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @micropost = microposts(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Micropost.count' do
      delete micropost_path(@micropost)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:michael))
    micropost = microposts(:ants)
    assert_no_difference 'Micropost.count' do
      delete micropost_path(micropost)
    end
    assert_redirected_to root_url
  end

  test "micropost with reply" do
    log_in_as(@user)
    get root_path
    assert_no_difference 'Reply.count' do
      post microposts_path, params: { micropost: { 
        content: "@no exit user\ntest"}}
    end
    assert_difference 'Reply.count', 1 do
      post microposts_path, params: {micropost: { 
        content: "@#{@other_user.name}\ntest"}}
    end
  end
end
