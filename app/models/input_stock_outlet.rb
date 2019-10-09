# == Schema Information
#
# Table name: input_stock_outlets
#
#  id            :bigint           not null, primary key
#  input_type_id :bigint
#  input_id      :bigint
#  reason        :string
#  quantity      :integer
#  unit          :string
#  status        :string
#  user_id       :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class InputStockOutlet < ApplicationRecord
  belongs_to :user

  #Validations
  validates :quantity,  numericality: { only_integer: true , greater_than: 0}
end
