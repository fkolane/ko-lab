# == Schema Information
#
# Table name: prestation_types
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PrestationType < ApplicationRecord
  belongs_to :user
  has_many :prestations, dependent: :destroy
end
