# == Schema Information
#
# Table name: profiles
#
#  id            :bigint           not null, primary key
#  first_name    :string
#  last_name     :string
#  gender        :string
#  phone         :string
#  specialty_one :string
#  user_id       :bigint
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
