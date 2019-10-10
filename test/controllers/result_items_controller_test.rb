require 'test_helper'

class ResultItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @result_item = result_items(:one)
  end

  test "should get index" do
    get result_items_url
    assert_response :success
  end

  test "should get new" do
    get new_result_item_url
    assert_response :success
  end

  test "should create result_item" do
    assert_difference('ResultItem.count') do
      post result_items_url, params: { result_item: {  } }
    end

    assert_redirected_to result_item_url(ResultItem.last)
  end

  test "should show result_item" do
    get result_item_url(@result_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_result_item_url(@result_item)
    assert_response :success
  end

  test "should update result_item" do
    patch result_item_url(@result_item), params: { result_item: {  } }
    assert_redirected_to result_item_url(@result_item)
  end

  test "should destroy result_item" do
    assert_difference('ResultItem.count', -1) do
      delete result_item_url(@result_item)
    end

    assert_redirected_to result_items_url
  end
end
