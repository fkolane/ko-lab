# == Schema Information
#
# Table name: input_types
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class InputType < ApplicationRecord
  belongs_to :user
  has_many :inputs, dependent: :destroy
end
