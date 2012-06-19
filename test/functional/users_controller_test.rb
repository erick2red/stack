require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get enable" do
    get :enable
    assert_response :success
  end

  test "should get disable" do
    get :disable
    assert_response :success
  end

end
