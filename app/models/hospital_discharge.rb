# == Schema Information
#
# Table name: hospital_discharges
#
#  id                      :bigint           not null, primary key
#  hospital_discharge_mode :string
#  patient_id              :bigint
#  medical_record_id       :bigint
#  service_id              :bigint
#  doctor_id               :bigint           not null
#  destination_hospital    :string
#  destination_service     :string
#  reason                  :string
#  notes                   :text
#  status                  :string
#  user_id                 :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class HospitalDischarge < ApplicationRecord
  belongs_to :patient
  belongs_to :medical_record
  belongs_to :service
  belongs_to :doctor
  belongs_to :user
end
