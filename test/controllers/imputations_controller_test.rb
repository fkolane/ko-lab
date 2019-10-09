require 'test_helper'

class ImputationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imputation = imputations(:one)
  end

  test "should get index" do
    get imputations_url
    assert_response :success
  end

  test "should get new" do
    get new_imputation_url
    assert_response :success
  end

  test "should create imputation" do
    assert_difference('Imputation.count') do
      post imputations_url, params: { imputation: { agent_id: @imputation.agent_id, arrival_mail_id: @imputation.arrival_mail_id, reason: @imputation.reason, reserved_suite: @imputation.reserved_suite, service_id: @imputation.service_id } }
    end

    assert_redirected_to imputation_url(Imputation.last)
  end

  test "should show imputation" do
    get imputation_url(@imputation)
    assert_response :success
  end

  test "should get edit" do
    get edit_imputation_url(@imputation)
    assert_response :success
  end

  test "should update imputation" do
    patch imputation_url(@imputation), params: { imputation: { agent_id: @imputation.agent_id, arrival_mail_id: @imputation.arrival_mail_id, reason: @imputation.reason, reserved_suite: @imputation.reserved_suite, service_id: @imputation.service_id } }
    assert_redirected_to imputation_url(@imputation)
  end

  test "should destroy imputation" do
    assert_difference('Imputation.count', -1) do
      delete imputation_url(@imputation)
    end

    assert_redirected_to imputations_url
  end
end
