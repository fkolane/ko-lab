require "application_system_test_case"

class ResultsTest < ApplicationSystemTestCase
  setup do
    @result = results(:one)
  end

  test "visiting the index" do
    visit results_url
    assert_selector "h1", text: "Results"
  end

  test "creating a Result" do
    visit results_url
    click_on "New Result"

    fill_in "Analyse element", with: @result.analyse_element_id
    fill_in "Analysis", with: @result.analysis_id
    fill_in "Comment", with: @result.comment
    fill_in "Normal value", with: @result.normal_value
    fill_in "Result value", with: @result.result_value
    fill_in "Sample type", with: @result.sample_type_id
    click_on "Create Result"

    assert_text "Result was successfully created"
    click_on "Back"
  end

  test "updating a Result" do
    visit results_url
    click_on "Edit", match: :first

    fill_in "Analyse element", with: @result.analyse_element_id
    fill_in "Analysis", with: @result.analysis_id
    fill_in "Comment", with: @result.comment
    fill_in "Normal value", with: @result.normal_value
    fill_in "Result value", with: @result.result_value
    fill_in "Sample type", with: @result.sample_type_id
    click_on "Update Result"

    assert_text "Result was successfully updated"
    click_on "Back"
  end

  test "destroying a Result" do
    visit results_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Result was successfully destroyed"
  end
end
