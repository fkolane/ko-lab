# == Schema Information
#
# Table name: imputations
#
#  id              :bigint           not null, primary key
#  arrival_mail_id :bigint
#  service_id      :bigint
#  agent_id        :bigint
#  reason          :text
#  opinion         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class ImputationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
