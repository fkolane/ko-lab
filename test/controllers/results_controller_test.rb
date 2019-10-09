require 'test_helper'

class ResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @result = results(:one)
  end

  test "should get index" do
    get results_url
    assert_response :success
  end

  test "should get new" do
    get new_result_url
    assert_response :success
  end

  test "should create result" do
    assert_difference('Result.count') do
      post results_url, params: { result: { analyse_element_id: @result.analyse_element_id, analysis_id: @result.analysis_id, comment: @result.comment, normal_value: @result.normal_value, result_value: @result.result_value, sample_type_id: @result.sample_type_id } }
    end

    assert_redirected_to result_url(Result.last)
  end

  test "should show result" do
    get result_url(@result)
    assert_response :success
  end

  test "should get edit" do
    get edit_result_url(@result)
    assert_response :success
  end

  test "should update result" do
    patch result_url(@result), params: { result: { analyse_element_id: @result.analyse_element_id, analysis_id: @result.analysis_id, comment: @result.comment, normal_value: @result.normal_value, result_value: @result.result_value, sample_type_id: @result.sample_type_id } }
    assert_redirected_to result_url(@result)
  end

  test "should destroy result" do
    assert_difference('Result.count', -1) do
      delete result_url(@result)
    end

    assert_redirected_to results_url
  end
end
