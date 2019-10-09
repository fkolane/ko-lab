# == Schema Information
#
# Table name: medical_records
#
#  id         :bigint           not null, primary key
#  patient_id :bigint
#  status     :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MedicalRecord < ApplicationRecord
  belongs_to :patient
  belongs_to :user
  has_many :medical_record_allergies, dependent: :destroy

end
