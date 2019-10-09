require 'test_helper'

class ArrivalMailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @arrival_mail = arrival_mails(:one)
  end

  test "should get index" do
    get arrival_mails_url
    assert_response :success
  end

  test "should get new" do
    get new_arrival_mail_url
    assert_response :success
  end

  test "should create arrival_mail" do
    assert_difference('ArrivalMail.count') do
      post arrival_mails_url, params: { arrival_mail: { arrival_date: @arrival_mail.arrival_date, mail_date: @arrival_mail.mail_date, nature: @arrival_mail.nature, object: @arrival_mail.object, origin: @arrival_mail.origin, recipient: @arrival_mail.recipient, reference: @arrival_mail.reference, status: @arrival_mail.status, user_id: @arrival_mail.user_id } }
    end

    assert_redirected_to arrival_mail_url(ArrivalMail.last)
  end

  test "should show arrival_mail" do
    get arrival_mail_url(@arrival_mail)
    assert_response :success
  end

  test "should get edit" do
    get edit_arrival_mail_url(@arrival_mail)
    assert_response :success
  end

  test "should update arrival_mail" do
    patch arrival_mail_url(@arrival_mail), params: { arrival_mail: { arrival_date: @arrival_mail.arrival_date, mail_date: @arrival_mail.mail_date, nature: @arrival_mail.nature, object: @arrival_mail.object, origin: @arrival_mail.origin, recipient: @arrival_mail.recipient, reference: @arrival_mail.reference, status: @arrival_mail.status, user_id: @arrival_mail.user_id } }
    assert_redirected_to arrival_mail_url(@arrival_mail)
  end

  test "should destroy arrival_mail" do
    assert_difference('ArrivalMail.count', -1) do
      delete arrival_mail_url(@arrival_mail)
    end

    assert_redirected_to arrival_mails_url
  end
end
