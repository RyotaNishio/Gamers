require "test_helper"

class PopsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pops_new_url
    assert_response :success
  end

  test "should get index" do
    get pops_index_url
    assert_response :success
  end

  test "should get show" do
    get pops_show_url
    assert_response :success
  end

  test "should get edit" do
    get pops_edit_url
    assert_response :success
  end
end
