require "application_system_test_case"

class TestParameterRefRangesTest < ApplicationSystemTestCase
  setup do
    @test_parameter_ref_range = test_parameter_ref_ranges(:one)
  end

  test "visiting the index" do
    visit test_parameter_ref_ranges_url
    assert_selector "h1", text: "Test parameter ref ranges"
  end

  test "should create test parameter ref range" do
    visit test_parameter_ref_ranges_url
    click_on "New test parameter ref range"

    fill_in "Color", with: @test_parameter_ref_range.color
    fill_in "Lower limit", with: @test_parameter_ref_range.lower_limit
    fill_in "Result type", with: @test_parameter_ref_range.result_type
    fill_in "Upper limit", with: @test_parameter_ref_range.upper_limit
    click_on "Create Test parameter ref range"

    assert_text "Test parameter ref range was successfully created"
    click_on "Back"
  end

  test "should update Test parameter ref range" do
    visit test_parameter_ref_range_url(@test_parameter_ref_range)
    click_on "Edit this test parameter ref range", match: :first

    fill_in "Color", with: @test_parameter_ref_range.color
    fill_in "Lower limit", with: @test_parameter_ref_range.lower_limit
    fill_in "Result type", with: @test_parameter_ref_range.result_type
    fill_in "Upper limit", with: @test_parameter_ref_range.upper_limit
    click_on "Update Test parameter ref range"

    assert_text "Test parameter ref range was successfully updated"
    click_on "Back"
  end

  test "should destroy Test parameter ref range" do
    visit test_parameter_ref_range_url(@test_parameter_ref_range)
    click_on "Destroy this test parameter ref range", match: :first

    assert_text "Test parameter ref range was successfully destroyed"
  end
end
