# == Schema Information
#
# Table name: life_qualities
#
#  id                    :bigint           not null, primary key
#  sufficient            :boolean
#  dependent             :boolean
#  access_drinking_water :boolean
#  city                  :boolean
#  suburb                :boolean
#  village               :boolean
#  promiscuity           :boolean
#  consultation_id       :bigint
#  status                :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class LifeQuality < ApplicationRecord
  belongs_to :consultation
end
