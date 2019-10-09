# == Schema Information
#
# Table name: ethnic_groups
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class EthnicGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
