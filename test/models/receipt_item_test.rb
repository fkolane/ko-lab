# == Schema Information
#
# Table name: receipt_items
#
#  id          :bigint           not null, primary key
#  receipt_id  :bigint
#  analysis_id :bigint
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ReceiptItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
