require "application_system_test_case"

class SampleTypesTest < ApplicationSystemTestCase
  setup do
    @sample_type = sample_types(:one)
  end

  test "visiting the index" do
    visit sample_types_url
    assert_selector "h1", text: "Sample Types"
  end

  test "creating a Sample type" do
    visit sample_types_url
    click_on "New Sample Type"

    fill_in "Description", with: @sample_type.description
    fill_in "Name", with: @sample_type.name
    click_on "Create Sample type"

    assert_text "Sample type was successfully created"
    click_on "Back"
  end

  test "updating a Sample type" do
    visit sample_types_url
    click_on "Edit", match: :first

    fill_in "Description", with: @sample_type.description
    fill_in "Name", with: @sample_type.name
    click_on "Update Sample type"

    assert_text "Sample type was successfully updated"
    click_on "Back"
  end

  test "destroying a Sample type" do
    visit sample_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sample type was successfully destroyed"
  end
end
