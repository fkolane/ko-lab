# == Schema Information
#
# Table name: samples
#
#  id             :bigint           not null, primary key
#  patient_id     :bigint
#  sample_type_id :bigint
#  status         :string
#  user_id        :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class SampleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
