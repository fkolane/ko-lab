# == Schema Information
#
# Table name: receipts
#
#  id               :bigint           not null, primary key
#  patient_id       :bigint
#  analysis_id      :bigint
#  amount           :float            default(0.0)
#  insurance_amount :float            default(0.0)
#  total_amount     :float            default(0.0)
#  status           :string
#  user_id          :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class ReceiptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
