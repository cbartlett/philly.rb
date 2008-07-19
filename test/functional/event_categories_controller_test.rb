require 'test_helper'

class EventCategoriesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:event_categories)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_event_category
    assert_difference('EventCategory.count') do
      post :create, :event_category => { }
    end

    assert_redirected_to event_category_path(assigns(:event_category))
  end

  def test_should_show_event_category
    get :show, :id => event_categories(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => event_categories(:one).id
    assert_response :success
  end

  def test_should_update_event_category
    put :update, :id => event_categories(:one).id, :event_category => { }
    assert_redirected_to event_category_path(assigns(:event_category))
  end

  def test_should_destroy_event_category
    assert_difference('EventCategory.count', -1) do
      delete :destroy, :id => event_categories(:one).id
    end

    assert_redirected_to event_categories_path
  end
end
