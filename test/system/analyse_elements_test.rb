require "application_system_test_case"

class AnalyseElementsTest < ApplicationSystemTestCase
  setup do
    @analyse_element = analyse_elements(:one)
  end

  test "visiting the index" do
    visit analyse_elements_url
    assert_selector "h1", text: "Analyse Elements"
  end

  test "creating a Analyse element" do
    visit analyse_elements_url
    click_on "New Analyse Element"

    fill_in "Analyse", with: @analyse_element.analyse_id
    fill_in "Name", with: @analyse_element.name
    fill_in "Normal value", with: @analyse_element.normal_value
    fill_in "Status", with: @analyse_element.status
    click_on "Create Analyse element"

    assert_text "Analyse element was successfully created"
    click_on "Back"
  end

  test "updating a Analyse element" do
    visit analyse_elements_url
    click_on "Edit", match: :first

    fill_in "Analyse", with: @analyse_element.analyse_id
    fill_in "Name", with: @analyse_element.name
    fill_in "Normal value", with: @analyse_element.normal_value
    fill_in "Status", with: @analyse_element.status
    click_on "Update Analyse element"

    assert_text "Analyse element was successfully updated"
    click_on "Back"
  end

  test "destroying a Analyse element" do
    visit analyse_elements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Analyse element was successfully destroyed"
  end
end
