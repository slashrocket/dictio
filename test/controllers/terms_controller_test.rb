require 'test_helper'

class TermsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: terms(:slashrocket).id
    assert_response :success
  end

end
