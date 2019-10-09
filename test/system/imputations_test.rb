require "application_system_test_case"

class ImputationsTest < ApplicationSystemTestCase
  setup do
    @imputation = imputations(:one)
  end

  test "visiting the index" do
    visit imputations_url
    assert_selector "h1", text: "Imputations"
  end

  test "creating a Imputation" do
    visit imputations_url
    click_on "New Imputation"

    fill_in "Agent", with: @imputation.agent_id
    fill_in "Arrival mail", with: @imputation.arrival_mail_id
    fill_in "Reason", with: @imputation.reason
    fill_in "Reserved suite", with: @imputation.reserved_suite
    fill_in "Service", with: @imputation.service_id
    click_on "Create Imputation"

    assert_text "Imputation was successfully created"
    click_on "Back"
  end

  test "updating a Imputation" do
    visit imputations_url
    click_on "Edit", match: :first

    fill_in "Agent", with: @imputation.agent_id
    fill_in "Arrival mail", with: @imputation.arrival_mail_id
    fill_in "Reason", with: @imputation.reason
    fill_in "Reserved suite", with: @imputation.reserved_suite
    fill_in "Service", with: @imputation.service_id
    click_on "Update Imputation"

    assert_text "Imputation was successfully updated"
    click_on "Back"
  end

  test "destroying a Imputation" do
    visit imputations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Imputation was successfully destroyed"
  end
end
