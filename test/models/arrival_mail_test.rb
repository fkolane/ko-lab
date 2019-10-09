# == Schema Information
#
# Table name: arrival_mails
#
#  id           :bigint           not null, primary key
#  arrival_date :datetime
#  origin       :string
#  reference    :string
#  mail_date    :datetime
#  recipient    :string
#  nature       :string
#  object       :string
#  status       :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ArrivalMailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
