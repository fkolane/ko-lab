# == Schema Information
#
# Table name: input_stock_entries
#
#  id              :bigint           not null, primary key
#  input_type_id   :bigint
#  input_id        :bigint
#  reason          :string
#  provider_id     :bigint
#  quantity        :integer
#  unit            :string
#  delivery_number :string
#  status          :string
#  user_id         :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class InputStockEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
