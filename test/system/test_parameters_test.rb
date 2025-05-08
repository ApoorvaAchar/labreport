require "application_system_test_case"

class TestParametersTest < ApplicationSystemTestCase
  setup do
    @test_parameter = test_parameters(:one)
  end

  test "visiting the index" do
    visit test_parameters_url
    assert_selector "h1", text: "Test parameters"
  end

  test "should create test parameter" do
    visit test_parameters_url
    click_on "New test parameter"

    fill_in "Cause effect", with: @test_parameter.cause_effect
    fill_in "Description", with: @test_parameter.description
    fill_in "Did you konw", with: @test_parameter.did_you_konw
    fill_in "Key", with: @test_parameter.key
    fill_in "Name", with: @test_parameter.name
    fill_in "What can do", with: @test_parameter.what_can_do
    click_on "Create Test parameter"

    assert_text "Test parameter was successfully created"
    click_on "Back"
  end

  test "should update Test parameter" do
    visit test_parameter_url(@test_parameter)
    click_on "Edit this test parameter", match: :first

    fill_in "Cause effect", with: @test_parameter.cause_effect
    fill_in "Description", with: @test_parameter.description
    fill_in "Did you konw", with: @test_parameter.did_you_konw
    fill_in "Key", with: @test_parameter.key
    fill_in "Name", with: @test_parameter.name
    fill_in "What can do", with: @test_parameter.what_can_do
    click_on "Update Test parameter"

    assert_text "Test parameter was successfully updated"
    click_on "Back"
  end

  test "should destroy Test parameter" do
    visit test_parameter_url(@test_parameter)
    click_on "Destroy this test parameter", match: :first

    assert_text "Test parameter was successfully destroyed"
  end
end
