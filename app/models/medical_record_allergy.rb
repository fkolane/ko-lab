# == Schema Information
#
# Table name: medical_record_allergies
#
#  id                :bigint           not null, primary key
#  medical_record_id :bigint
#  allergy_id        :bigint
#  notes             :text
#  status            :string
#  user_id           :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class MedicalRecordAllergy < ApplicationRecord
  belongs_to :medical_record
  belongs_to :allergy
  belongs_to :user
end
