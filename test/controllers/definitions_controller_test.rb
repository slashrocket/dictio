require 'test_helper'

class DefinitionsControllerTest < ActionController::TestCase
  test "get new is successful" do
    sign_in
    get :new, term_id: terms(:slashrocket)
    assert_kind_of Definition, assigns(:definition)
    assert_response :success
  end

  test "should get edit" do
    sign_in
    get :edit, id: definitions(:slashrocketDef), term_id: terms(:slashrocket)
    assert_equal definitions(:slashrocketDef), assigns(:definition)
    assert_response :success
  end

  test "post create is successful with valid attributes" do
    sign_in
    definition_params = { meaning: "An online community that's super cool and helps people learn web development." }
    assert_difference "Definition.count" do
      post :create, term_id: terms(:slashrocket), definition: definition_params
    end
    assert_redirected_to term_path(terms(:slashrocket))
  end

  test "post create is unsuccessful with invalid attributes" do
    sign_in
    definition_params = { meaning: "Super cool place to learn stuff." }
    assert_no_difference "Definition.count" do
      post :create, term_id: terms(:slashrocket), definition: definition_params
    end
    assert_template "new"
    assert_response :success
  end

  test "put update is successful with valid attributes" do
    sign_in
    valid_attributes = { meaning: "This definition has a new meaning. Slashrocket loves Slack so much! Oh, and Rails!" }
    put :update, term_id: terms(:slashrocket), id: definitions(:slashrocketDef), definition: valid_attributes
    assert_equal valid_attributes[:meaning], definitions(:slashrocketDef).reload.meaning
    assert_redirected_to term_path(terms(:slashrocket))
  end

  test "put update is unsuccessful with invalid attributes" do
    sign_in
    invalid_attributes = { meaning: "" }
    put :update, term_id: terms(:slashrocket), id: definitions(:slashrocketDef), definition: invalid_attributes
    refute_equal invalid_attributes[:meaning], definitions(:slashrocketDef).reload.meaning
    assert_template "edit"
    assert_response :success
  end

  test "delete destroy is successful" do
    sign_in
    assert_difference "Definition.count", -1 do
      delete :destroy, term_id: terms(:slashrocket), id: definitions(:slashrocketDef)
    end
    assert_redirected_to term_path(terms(:slashrocket))
  end

end
