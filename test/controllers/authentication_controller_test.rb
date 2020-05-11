require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should get none" do
    get authentication_none_url
    assert_response :success
  end

  test "should get signature" do
    get authentication_signature_url
    assert_response :success
  end

  test "should get weak" do
    get authentication_weak_url
    assert_response :success
  end

  test "should get hmac" do
    get authentication_hmac_url
    assert_response :success
  end

  test "should get rce" do
    get authentication_rce_url
    assert_response :success
  end

end
