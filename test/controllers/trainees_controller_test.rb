require 'test_helper'

class TraineesControllerTest < ActionController::TestCase
  setup do
    @trainee = trainees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trainees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trainee" do
    assert_difference('Trainee.count') do
      post :create, trainee: { apprenticeship_freeform1: @trainee.apprenticeship_freeform1, apprenticeship_freeform2: @trainee.apprenticeship_freeform2, apprenticeship_specialty1: @trainee.apprenticeship_specialty1, apprenticeship_specialty2: @trainee.apprenticeship_specialty2, broadcasters_exam: @trainee.broadcasters_exam, demotape: @trainee.demotape, dept: @trainee.dept, email: @trainee.email, experience: @trainee.experience, interests: @trainee.interests, name: @trainee.name, phone: @trainee.phone, referral: @trainee.referral, stage1: @trainee.stage1, stage2: @trainee.stage2, statement: @trainee.statement, status: @trainee.status, umid: @trainee.umid }
    end

    assert_redirected_to trainee_path(assigns(:trainee))
  end

  test "should show trainee" do
    get :show, id: @trainee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trainee
    assert_response :success
  end

  test "should update trainee" do
    patch :update, id: @trainee, trainee: { apprenticeship_freeform1: @trainee.apprenticeship_freeform1, apprenticeship_freeform2: @trainee.apprenticeship_freeform2, apprenticeship_specialty1: @trainee.apprenticeship_specialty1, apprenticeship_specialty2: @trainee.apprenticeship_specialty2, broadcasters_exam: @trainee.broadcasters_exam, demotape: @trainee.demotape, dept: @trainee.dept, email: @trainee.email, experience: @trainee.experience, interests: @trainee.interests, name: @trainee.name, phone: @trainee.phone, referral: @trainee.referral, stage1: @trainee.stage1, stage2: @trainee.stage2, statement: @trainee.statement, status: @trainee.status, umid: @trainee.umid }
    assert_redirected_to trainee_path(assigns(:trainee))
  end

  test "should destroy trainee" do
    assert_difference('Trainee.count', -1) do
      delete :destroy, id: @trainee
    end

    assert_redirected_to trainees_path
  end
end
