require 'test_helper'

class HomepageControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get splash" do
    get :splash
    assert_response :success
  end

end
