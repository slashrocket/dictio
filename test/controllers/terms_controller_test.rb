require 'test_helper'

class TermsControllerTest < ActionController::TestCase
  include ApplicationHelper

  test "get index is successful" do
    get :index
    assert_includes assigns(:terms), terms(:slashrocket)
    assert_response :success
    assert_select 'title', 'Dictio'
  end

  test "get index includes all terms by default" do
    get :index
    assert_equal Term.count, assigns(:terms).count
  end

  test "get new is successful" do
    sign_in
    get :new
    assert_kind_of Term, assigns(:term)
    assert_response :success
    assert_select 'title', 'Dictio | New Term'
  end

  test "get show is successful" do
    get :show, id: terms(:slashrocket)
    assert_equal terms(:slashrocket), assigns(:term)
    assert_response :success
    assert_select 'title', full_title(terms(:slashrocket).name)
  end

  test "get edit is successful" do
    sign_in
    get :edit, id: terms(:slashrocket)
    assert_equal terms(:slashrocket), assigns(:term)
    assert_response :success
  end

  test "post create is successful with valid attributes" do
    sign_in
    term_params = { name: "Test Driven Development", acronym: "TDD", user_id: users(:one).id, definitions_attributes: [meaning: definitions(:slashrocketDef).meaning, user_id: users(:one).id] }
    assert_difference "Term.count" do
      post :create, term: term_params
    end
    assert_redirected_to Term.last
    assert_equal 'Term created!', flash[:success]
  end

  test "post create is unsuccessful with invalid attributes" do
    sign_in
    term_params = { name: "", user_id: users(:one).id, definitions_attributes: [meaning: definitions(:slashrocketDef).meaning, user_id: users(:one).id] }
    assert_no_difference "Term.count" do
      post :create, term: term_params
    end
    assert_template "new"
    assert_response :success
  end

  test "put update is successful with valid attributes" do
    sign_in
    valid_attributes = { name: "Atom" }
    put :update, id: terms(:slashrocket), term: valid_attributes
    assert_equal valid_attributes[:name], terms(:slashrocket).reload.name
    assert_redirected_to term_path(terms(:slashrocket))
    assert_equal 'Term updated!', flash[:success]
  end

  test "put update is unsuccessful with invalid attributes" do
    sign_in
    invalid_attributes = { name: "" }
    put :update, id: terms(:slashrocket), term: invalid_attributes
    refute_equal invalid_attributes[:name], terms(:slashrocket).reload.name
    assert_template "edit"
    assert_response :success
  end

  test "delete destroy is successful" do
    sign_in
    assert_difference "Term.count", -1 do
      delete :destroy, id: terms(:slashrocket)
    end
    assert_redirected_to root_url
    assert_equal 'Term deleted!', flash[:error]
  end

end
