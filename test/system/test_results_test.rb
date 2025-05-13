require "application_system_test_case"

class TestResultsTest < ApplicationSystemTestCase
  setup do
    @test_result = test_results(:one)
  end

  test "visiting the index" do
    visit test_results_url
    assert_selector "h1", text: "Test results"
  end

  test "should create test result" do
    visit test_results_url
    click_on "New test result"

    fill_in "Patient name", with: @test_result.patient_name
    fill_in "Pdf", with: @test_result.pdf
    fill_in "Result", with: @test_result.result
    fill_in "Status", with: @test_result.status
    click_on "Create Test result"

    assert_text "Test result was successfully created"
    click_on "Back"
  end

  test "should update Test result" do
    visit test_result_url(@test_result)
    click_on "Edit this test result", match: :first

    fill_in "Patient name", with: @test_result.patient_name
    fill_in "Pdf", with: @test_result.pdf
    fill_in "Result", with: @test_result.result
    fill_in "Status", with: @test_result.status
    click_on "Update Test result"

    assert_text "Test result was successfully updated"
    click_on "Back"
  end

  test "should destroy Test result" do
    visit test_result_url(@test_result)
    click_on "Destroy this test result", match: :first

    assert_text "Test result was successfully destroyed"
  end
end
