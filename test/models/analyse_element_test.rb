# == Schema Information
#
# Table name: analyse_elements
#
#  id           :bigint           not null, primary key
#  analyse_id   :bigint
#  name         :string
#  normal_value :string
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class AnalyseElementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
