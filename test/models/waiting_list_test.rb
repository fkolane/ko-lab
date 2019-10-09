# == Schema Information
#
# Table name: waiting_lists
#
#  id         :bigint           not null, primary key
#  patient_id :bigint
#  analyse_id :bigint
#  receipt_id :bigint
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class WaitingListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
