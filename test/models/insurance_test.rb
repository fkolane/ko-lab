# == Schema Information
#
# Table name: insurances
#
#  id          :bigint           not null, primary key
#  name        :string
#  limited     :string
#  limit_age   :bigint
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class InsuranceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
