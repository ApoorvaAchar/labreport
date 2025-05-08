require "application_system_test_case"

class LabTestsTest < ApplicationSystemTestCase
  setup do
    @lab_test = lab_tests(:one)
  end

  test "visiting the index" do
    visit lab_tests_url
    assert_selector "h1", text: "Lab tests"
  end

  test "should create lab test" do
    visit lab_tests_url
    click_on "New lab test"

    fill_in "Name", with: @lab_test.name
    click_on "Create Lab test"

    assert_text "Lab test was successfully created"
    click_on "Back"
  end

  test "should update Lab test" do
    visit lab_test_url(@lab_test)
    click_on "Edit this lab test", match: :first

    fill_in "Name", with: @lab_test.name
    click_on "Update Lab test"

    assert_text "Lab test was successfully updated"
    click_on "Back"
  end

  test "should destroy Lab test" do
    visit lab_test_url(@lab_test)
    click_on "Destroy this lab test", match: :first

    assert_text "Lab test was successfully destroyed"
  end
end
