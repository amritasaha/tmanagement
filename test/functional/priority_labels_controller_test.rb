require 'test_helper'

class PriorityLabelsControllerTest < ActionController::TestCase
  setup do
    @priority_label = priority_labels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:priority_labels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create priority_label" do
    assert_difference('PriorityLabel.count') do
      post :create, priority_label: { color: @priority_label.color, title: @priority_label.title }
    end

    assert_redirected_to priority_label_path(assigns(:priority_label))
  end

  test "should show priority_label" do
    get :show, id: @priority_label
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @priority_label
    assert_response :success
  end

  test "should update priority_label" do
    put :update, id: @priority_label, priority_label: { color: @priority_label.color, title: @priority_label.title }
    assert_redirected_to priority_label_path(assigns(:priority_label))
  end

  test "should destroy priority_label" do
    assert_difference('PriorityLabel.count', -1) do
      delete :destroy, id: @priority_label
    end

    assert_redirected_to priority_labels_path
  end
end
