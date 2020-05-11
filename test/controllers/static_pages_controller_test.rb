require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get "/home"
    assert_response :success
  end

  test "should get help" do
    get "/help"
    assert_response :success
  end

  test "should get challenges" do
    get "/challenges"
    assert_response :success
  end

end
