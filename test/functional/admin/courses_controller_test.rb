require 'test_helper'

class Admin::CoursesControllerTest < ActionController::TestCase
  setup do
    @admin_course = admin_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_course" do
    assert_difference('Admin::Course.count') do
      post :create, admin_course: { course_type: @admin_course.course_type, description: @admin_course.description, discounts: @admin_course.discounts, end_date: @admin_course.end_date, fees: @admin_course.fees, start_date: @admin_course.start_date, timing: @admin_course.timing, title: @admin_course.title, venue: @admin_course.venue }
    end

    assert_redirected_to admin_course_path(assigns(:admin_course))
  end

  test "should show admin_course" do
    get :show, id: @admin_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_course
    assert_response :success
  end

  test "should update admin_course" do
    put :update, id: @admin_course, admin_course: { course_type: @admin_course.course_type, description: @admin_course.description, discounts: @admin_course.discounts, end_date: @admin_course.end_date, fees: @admin_course.fees, start_date: @admin_course.start_date, timing: @admin_course.timing, title: @admin_course.title, venue: @admin_course.venue }
    assert_redirected_to admin_course_path(assigns(:admin_course))
  end

  test "should destroy admin_course" do
    assert_difference('Admin::Course.count', -1) do
      delete :destroy, id: @admin_course
    end

    assert_redirected_to admin_courses_path
  end
end
