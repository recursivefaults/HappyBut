require 'test_helper'

class HappiesControllerTest < ActionController::TestCase
  setup do
    @happy = happies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:happies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create happy" do
    assert_difference('Happy.count') do
      post :create, happy: {  }
    end

    assert_redirected_to happy_path(assigns(:happy))
  end

  test "should show happy" do
    get :show, id: @happy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @happy
    assert_response :success
  end

  test "should update happy" do
    put :update, id: @happy, happy: {  }
    assert_redirected_to happy_path(assigns(:happy))
  end

  test "should destroy happy" do
    assert_difference('Happy.count', -1) do
      delete :destroy, id: @happy
    end

    assert_redirected_to happies_path
  end
end
