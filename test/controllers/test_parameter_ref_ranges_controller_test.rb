require "test_helper"

class TestParameterRefRangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_parameter_ref_range = test_parameter_ref_ranges(:one)
  end

  test "should get index" do
    get test_parameter_ref_ranges_url
    assert_response :success
  end

  test "should get new" do
    get new_test_parameter_ref_range_url
    assert_response :success
  end

  test "should create test_parameter_ref_range" do
    assert_difference("TestParameterRefRange.count") do
      post test_parameter_ref_ranges_url, params: { test_parameter_ref_range: { color: @test_parameter_ref_range.color, lower_limit: @test_parameter_ref_range.lower_limit, result_type: @test_parameter_ref_range.result_type, upper_limit: @test_parameter_ref_range.upper_limit } }
    end

    assert_redirected_to test_parameter_ref_range_url(TestParameterRefRange.last)
  end

  test "should show test_parameter_ref_range" do
    get test_parameter_ref_range_url(@test_parameter_ref_range)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_parameter_ref_range_url(@test_parameter_ref_range)
    assert_response :success
  end

  test "should update test_parameter_ref_range" do
    patch test_parameter_ref_range_url(@test_parameter_ref_range), params: { test_parameter_ref_range: { color: @test_parameter_ref_range.color, lower_limit: @test_parameter_ref_range.lower_limit, result_type: @test_parameter_ref_range.result_type, upper_limit: @test_parameter_ref_range.upper_limit } }
    assert_redirected_to test_parameter_ref_range_url(@test_parameter_ref_range)
  end

  test "should destroy test_parameter_ref_range" do
    assert_difference("TestParameterRefRange.count", -1) do
      delete test_parameter_ref_range_url(@test_parameter_ref_range)
    end

    assert_redirected_to test_parameter_ref_ranges_url
  end
end
