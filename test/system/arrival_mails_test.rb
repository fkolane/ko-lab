require "application_system_test_case"

class ArrivalMailsTest < ApplicationSystemTestCase
  setup do
    @arrival_mail = arrival_mails(:one)
  end

  test "visiting the index" do
    visit arrival_mails_url
    assert_selector "h1", text: "Arrival Mails"
  end

  test "creating a Arrival mail" do
    visit arrival_mails_url
    click_on "New Arrival Mail"

    fill_in "Arrival date", with: @arrival_mail.arrival_date
    fill_in "Mail date", with: @arrival_mail.mail_date
    fill_in "Nature", with: @arrival_mail.nature
    fill_in "Object", with: @arrival_mail.object
    fill_in "Origin", with: @arrival_mail.origin
    fill_in "Recipient", with: @arrival_mail.recipient
    fill_in "Reference", with: @arrival_mail.reference
    fill_in "Status", with: @arrival_mail.status
    fill_in "User", with: @arrival_mail.user_id
    click_on "Create Arrival mail"

    assert_text "Arrival mail was successfully created"
    click_on "Back"
  end

  test "updating a Arrival mail" do
    visit arrival_mails_url
    click_on "Edit", match: :first

    fill_in "Arrival date", with: @arrival_mail.arrival_date
    fill_in "Mail date", with: @arrival_mail.mail_date
    fill_in "Nature", with: @arrival_mail.nature
    fill_in "Object", with: @arrival_mail.object
    fill_in "Origin", with: @arrival_mail.origin
    fill_in "Recipient", with: @arrival_mail.recipient
    fill_in "Reference", with: @arrival_mail.reference
    fill_in "Status", with: @arrival_mail.status
    fill_in "User", with: @arrival_mail.user_id
    click_on "Update Arrival mail"

    assert_text "Arrival mail was successfully updated"
    click_on "Back"
  end

  test "destroying a Arrival mail" do
    visit arrival_mails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Arrival mail was successfully destroyed"
  end
end
