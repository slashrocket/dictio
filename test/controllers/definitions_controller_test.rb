require 'test_helper'

class DefinitionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, term_id: 1
    assert_response :success
  end

  test "should get show" do
    get :show, id: 1,term_id: 1
    assert_response :success
  end

  test "should get new" do
    get :new, term_id: 1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: 1, term_id: 1
    assert_response :success
  end

end
