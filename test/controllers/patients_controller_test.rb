require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient" do
    # Found a problem with the test and Uniqueness, where because testing with similar values, we have conflicts in the MRN therefore fails even though it can still create values.
    if Patient.exists?(MRN: @patient.MRN)
      @patient.MRN = @patient.MRN << "a"
      puts @patient.MRN
    end
    assert_difference('Patient.count') do
      post :create, patient: { MRN: @patient.MRN, first_name: @patient.first_name, height: @patient.height, last_name: @patient.last_name, middle_name: @patient.middle_name, weight: @patient.weight }
    end

    assert_redirected_to patients_url
  end

  test "should show patient" do
    get :show, id: @patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient
    assert_response :success
  end

  test "should update patient" do
    patch :update, id: @patient, patient: { MRN: @patient.MRN, first_name: @patient.first_name, height: @patient.height, last_name: @patient.last_name, middle_name: @patient.middle_name, weight: @patient.weight }
    assert_redirected_to patients_url
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete :destroy, id: @patient
    end

    assert_redirected_to patients_url
  end
end
