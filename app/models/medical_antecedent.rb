# == Schema Information
#
# Table name: medical_antecedents
#
#  id                  :bigint           not null, primary key
#  consultation_id     :bigint
#  hta                 :boolean
#  diabetes            :boolean
#  sickle_cell_disease :boolean
#  asthma              :boolean
#  tuberculosis        :boolean
#  ugd                 :boolean
#  others              :text
#  status              :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class MedicalAntecedent < ApplicationRecord
  belongs_to :consultation
end
