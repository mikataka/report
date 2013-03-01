require 'test_helper'

class RepbodiesControllerTest < ActionController::TestCase
  setup do
    @repbody = repbodies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repbodies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repbody" do
    assert_difference('Repbody.count') do
      post :create, repbody: { body: @repbody.body, date: @repbody.date, tag_id: @repbody.tag_id, title: @repbody.title, user_id: @repbody.user_id }
    end

    assert_redirected_to repbody_path(assigns(:repbody))
  end

  test "should show repbody" do
    get :show, id: @repbody
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @repbody
    assert_response :success
  end

  test "should update repbody" do
    put :update, id: @repbody, repbody: { body: @repbody.body, date: @repbody.date, tag_id: @repbody.tag_id, title: @repbody.title, user_id: @repbody.user_id }
    assert_redirected_to repbody_path(assigns(:repbody))
  end

  test "should destroy repbody" do
    assert_difference('Repbody.count', -1) do
      delete :destroy, id: @repbody
    end

    assert_redirected_to repbodies_path
  end
end
