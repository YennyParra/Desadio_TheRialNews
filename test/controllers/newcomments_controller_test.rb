require "test_helper"

class NewcommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newcomment = newcomments(:one)
  end

  test "should get index" do
    get newcomments_url
    assert_response :success
  end

  test "should get new" do
    get new_newcomment_url
    assert_response :success
  end

  test "should create newcomment" do
    assert_difference("Newcomment.count") do
      post newcomments_url, params: { newcomment: { body: @newcomment.body, pcuser_id: @newcomment.pcuser_id, report_id: @newcomment.report_id } }
    end

    assert_redirected_to newcomment_url(Newcomment.last)
  end

  test "should show newcomment" do
    get newcomment_url(@newcomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_newcomment_url(@newcomment)
    assert_response :success
  end

  test "should update newcomment" do
    patch newcomment_url(@newcomment), params: { newcomment: { body: @newcomment.body, pcuser_id: @newcomment.pcuser_id, report_id: @newcomment.report_id } }
    assert_redirected_to newcomment_url(@newcomment)
  end

  test "should destroy newcomment" do
    assert_difference("Newcomment.count", -1) do
      delete newcomment_url(@newcomment)
    end

    assert_redirected_to newcomments_url
  end
end
