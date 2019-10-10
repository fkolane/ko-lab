# == Schema Information
#
# Table name: results
#
#  id         :bigint           not null, primary key
#  receipt_id :bigint
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
