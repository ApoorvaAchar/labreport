require "test_helper"

class FileUploadsControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get file_uploads_upload_url
    assert_response :success
  end
end
