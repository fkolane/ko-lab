require "application_system_test_case"

class ReceiptAnalysesTest < ApplicationSystemTestCase
  setup do
    @receipt_analysis = receipt_analyses(:one)
  end

  test "visiting the index" do
    visit receipt_analyses_url
    assert_selector "h1", text: "Receipt Analyses"
  end

  test "creating a Receipt analysis" do
    visit receipt_analyses_url
    click_on "New Receipt Analysis"

    fill_in "Status", with: @receipt_analysis.status
    fill_in "User", with: @receipt_analysis.user_id
    click_on "Create Receipt analysis"

    assert_text "Receipt analysis was successfully created"
    click_on "Back"
  end

  test "updating a Receipt analysis" do
    visit receipt_analyses_url
    click_on "Edit", match: :first

    fill_in "Status", with: @receipt_analysis.status
    fill_in "User", with: @receipt_analysis.user_id
    click_on "Update Receipt analysis"

    assert_text "Receipt analysis was successfully updated"
    click_on "Back"
  end

  test "destroying a Receipt analysis" do
    visit receipt_analyses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Receipt analysis was successfully destroyed"
  end
end
