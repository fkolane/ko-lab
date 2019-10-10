require "application_system_test_case"

class ResultItemsTest < ApplicationSystemTestCase
  setup do
    @result_item = result_items(:one)
  end

  test "visiting the index" do
    visit result_items_url
    assert_selector "h1", text: "Result Items"
  end

  test "creating a Result item" do
    visit result_items_url
    click_on "New Result Item"

    click_on "Create Result item"

    assert_text "Result item was successfully created"
    click_on "Back"
  end

  test "updating a Result item" do
    visit result_items_url
    click_on "Edit", match: :first

    click_on "Update Result item"

    assert_text "Result item was successfully updated"
    click_on "Back"
  end

  test "destroying a Result item" do
    visit result_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Result item was successfully destroyed"
  end
end
