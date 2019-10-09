require 'test_helper'

class AnalyseElementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analyse_element = analyse_elements(:one)
  end

  test "should get index" do
    get analyse_elements_url
    assert_response :success
  end

  test "should get new" do
    get new_analyse_element_url
    assert_response :success
  end

  test "should create analyse_element" do
    assert_difference('AnalyseElement.count') do
      post analyse_elements_url, params: { analyse_element: { analyse_id: @analyse_element.analyse_id, name: @analyse_element.name, normal_value: @analyse_element.normal_value, status: @analyse_element.status } }
    end

    assert_redirected_to analyse_element_url(AnalyseElement.last)
  end

  test "should show analyse_element" do
    get analyse_element_url(@analyse_element)
    assert_response :success
  end

  test "should get edit" do
    get edit_analyse_element_url(@analyse_element)
    assert_response :success
  end

  test "should update analyse_element" do
    patch analyse_element_url(@analyse_element), params: { analyse_element: { analyse_id: @analyse_element.analyse_id, name: @analyse_element.name, normal_value: @analyse_element.normal_value, status: @analyse_element.status } }
    assert_redirected_to analyse_element_url(@analyse_element)
  end

  test "should destroy analyse_element" do
    assert_difference('AnalyseElement.count', -1) do
      delete analyse_element_url(@analyse_element)
    end

    assert_redirected_to analyse_elements_url
  end
end
