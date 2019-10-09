# == Schema Information
#
# Table name: inputs
#
#  id               :bigint           not null, primary key
#  input_type_id    :bigint
#  name             :string
#  manufacture_date :date
#  expiration_date  :date
#  batch_number     :string
#  cip              :string
#  manufacturer     :string
#  alert_level      :integer
#  shelf_number     :string
#  current_stock    :integer
#  status           :string
#  provider_id      :bigint
#  user_id          :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class InputTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
