# == Schema Information
#
# Table name: medical_record_closures
#
#  id                :bigint           not null, primary key
#  closure_reason_id :bigint           not null
#  patient_id        :bigint
#  medical_record_id :bigint
#  doctor_id         :bigint           not null
#  status            :string
#  user_id           :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class MedicalRecordClosure < ApplicationRecord
  belongs_to :medical_record_closure_reason
  belongs_to :patient
  belongs_to :medical_record
  belongs_to :user
end
