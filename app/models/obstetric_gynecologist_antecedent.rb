# == Schema Information
#
# Table name: obstetric_gynecologist_antecedents
#
#  id              :bigint           not null, primary key
#  pregnancy       :integer
#  parity          :integer
#  living          :integer
#  abortion        :integer
#  death           :integer
#  others          :text
#  consultation_id :bigint
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ObstetricGynecologistAntecedent < ApplicationRecord
  belongs_to :consultation
end
