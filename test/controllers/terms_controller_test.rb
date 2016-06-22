require 'test_helper'

class TermsControllerTest < ActionController::TestCase
  test "get index is successful" do
    get :index
    assert_includes assigns(:terms), terms(:slashrocket)
    assert_response :success
  end

  test "get index includes all terms by default" do
    get :index
    assert_equal Term.count, assigns(:terms).count
  end

  test "get new is successful" do
    get :new
    assert_kind_of Term, assigns(:term)
    assert_response :success
  end

  test "get show is successful" do
    get :show, id: terms(:slashrocket)
    assert_equal terms(:slashrocket), assigns(:term)
    assert_response :success
  end

  test "get edit is successful" do
    get :edit, id: terms(:slashrocket)
    assert_equal terms(:slashrocket), assigns(:term)
    assert_response :success
  end

  test "post create is successful with valid attributes" do
    term_params = { name: "Atom" }
    assert_difference "Term.count" do
      post :create, term: term_params
    end
    assert_redirected_to terms_path
  end

  test "post create is unsuccessful with invalid attributes" do
    term_params = { name: "" }
    assert_no_difference "Term.count" do
      post :create, term: term_params
    end
    assert_template "new"
    assert_response :success
  end

  test "put update is successful with valid attributes" do
    valid_attributes = { name: "Atom" }
    put :update, id: terms(:slashrocket), term: valid_attributes
    assert_equal valid_attributes[:name], terms(:slashrocket).reload.name
    assert_redirected_to term_path(terms(:slashrocket))
  end

  test "put update is unsuccessful with invalid attributes" do
    invalid_attributes = { name: "" }
    put :update, id: terms(:slashrocket), term: invalid_attributes
    refute_equal invalid_attributes[:name], terms(:slashrocket).reload.name
    assert_template "edit"
    assert_response :success
  end

  test "delete destroy is successful" do
    assert_difference "Term.count", -1 do
      delete :destroy, id: terms(:slashrocket)
    end
    assert_redirected_to root_url
  end

end
