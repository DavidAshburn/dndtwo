require "test_helper"

class LabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get dropdowns" do
    get labels_dropdowns_url
    assert_response :success
  end
end
