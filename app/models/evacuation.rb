# == Schema Information
#
# Table name: evacuations
#
#  id                   :bigint           not null, primary key
#  patient_id           :bigint
#  medical_record_id    :bigint
#  service_id           :bigint
#  doctor_id            :bigint           not null
#  destination_hospital :string
#  destination_service  :string
#  reason               :string
#  notes                :text
#  status               :string
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Evacuation < ApplicationRecord
  belongs_to :patient
  belongs_to :medical_record
  belongs_to :service
  belongs_to :doctor, :foreign_key => "doctor_id", :class_name => "User"
  belongs_to :user
end
