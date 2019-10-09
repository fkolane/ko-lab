# == Schema Information
#
# Table name: providers
#
#  id           :bigint           not null, primary key
#  company      :string
#  contact_name :string
#  address      :string
#  phone        :string
#  city         :string
#  country      :string
#  email        :string
#  status       :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
