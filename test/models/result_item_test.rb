# == Schema Information
#
# Table name: result_items
#
#  id                 :bigint           not null, primary key
#  result_id          :bigint
#  analysis_id        :bigint
#  sample_type_id     :bigint
#  analyse_element_id :bigint
#  normal_value       :string
#  result_value       :string
#  comment            :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ResultItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
