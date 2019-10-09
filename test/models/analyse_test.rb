# == Schema Information
#
# Table name: analyses
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :float
#  status     :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AnalyseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
