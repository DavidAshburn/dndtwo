require "test_helper"

class DatasetsControllerTest < ActionDispatch::IntegrationTest
  test "should get spells" do
    get datasets_spells_url
    assert_response :success
  end

  test "should get equipment" do
    get datasets_equipment_url
    assert_response :success
  end
end
