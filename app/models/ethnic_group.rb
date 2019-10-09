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

class EthnicGroup < ApplicationRecord
  belongs_to :user

  validates :name, presence: true , uniqueness: true
end
