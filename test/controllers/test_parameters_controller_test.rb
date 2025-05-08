require "test_helper"

class TestParametersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_parameter = test_parameters(:one)
  end

  test "should get index" do
    get test_parameters_url
    assert_response :success
  end

  test "should get new" do
    get new_test_parameter_url
    assert_response :success
  end

  test "should create test_parameter" do
    assert_difference("TestParameter.count") do
      post test_parameters_url, params: { test_parameter: { cause_effect: @test_parameter.cause_effect, description: @test_parameter.description, did_you_konw: @test_parameter.did_you_konw, key: @test_parameter.key, name: @test_parameter.name, what_can_do: @test_parameter.what_can_do } }
    end

    assert_redirected_to test_parameter_url(TestParameter.last)
  end

  test "should show test_parameter" do
    get test_parameter_url(@test_parameter)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_parameter_url(@test_parameter)
    assert_response :success
  end

  test "should update test_parameter" do
    patch test_parameter_url(@test_parameter), params: { test_parameter: { cause_effect: @test_parameter.cause_effect, description: @test_parameter.description, did_you_konw: @test_parameter.did_you_konw, key: @test_parameter.key, name: @test_parameter.name, what_can_do: @test_parameter.what_can_do } }
    assert_redirected_to test_parameter_url(@test_parameter)
  end

  test "should destroy test_parameter" do
    assert_difference("TestParameter.count", -1) do
      delete test_parameter_url(@test_parameter)
    end

    assert_redirected_to test_parameters_url
  end
end
