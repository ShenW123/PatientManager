require 'test_helper'

class EncountersControllerTest < ActionController::TestCase
  setup do
    @encounter = encounters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:encounters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create encounter" do
    assert_difference('Encounter.count') do
      post :create, encounter: { admitted_at: @encounter.admitted_at, bed: @encounter.bed, discharged_at: @encounter.discharged_at, location: @encounter.location, patient_mrn: @encounter.patient_mrn, room: @encounter.room, visit_number: @encounter.visit_number }
    end

    assert_redirected_to encounter_path(assigns(:encounter))
  end

  test "should show encounter" do
    get :show, id: @encounter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @encounter
    assert_response :success
  end

  test "should update encounter" do
    patch :update, id: @encounter, encounter: { admitted_at: @encounter.admitted_at, bed: @encounter.bed, discharged_at: @encounter.discharged_at, location: @encounter.location, patient_mrn: @encounter.patient_mrn, room: @encounter.room, visit_number: @encounter.visit_number }
    assert_redirected_to encounter_path(assigns(:encounter))
  end

  test "should destroy encounter" do
    assert_difference('Encounter.count', -1) do
      delete :destroy, id: @encounter
    end

    assert_redirected_to encounters_path
  end
end
