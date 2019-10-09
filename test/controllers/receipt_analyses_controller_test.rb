require 'test_helper'

class ReceiptAnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receipt_analysis = receipt_analyses(:one)
  end

  test "should get index" do
    get receipt_analyses_url
    assert_response :success
  end

  test "should get new" do
    get new_receipt_analysis_url
    assert_response :success
  end

  test "should create receipt_analysis" do
    assert_difference('ReceiptAnalysis.count') do
      post receipt_analyses_url, params: { receipt_analysis: { status: @receipt_analysis.status, user_id: @receipt_analysis.user_id } }
    end

    assert_redirected_to receipt_analysis_url(ReceiptAnalysis.last)
  end

  test "should show receipt_analysis" do
    get receipt_analysis_url(@receipt_analysis)
    assert_response :success
  end

  test "should get edit" do
    get edit_receipt_analysis_url(@receipt_analysis)
    assert_response :success
  end

  test "should update receipt_analysis" do
    patch receipt_analysis_url(@receipt_analysis), params: { receipt_analysis: { status: @receipt_analysis.status, user_id: @receipt_analysis.user_id } }
    assert_redirected_to receipt_analysis_url(@receipt_analysis)
  end

  test "should destroy receipt_analysis" do
    assert_difference('ReceiptAnalysis.count', -1) do
      delete receipt_analysis_url(@receipt_analysis)
    end

    assert_redirected_to receipt_analyses_url
  end
end
