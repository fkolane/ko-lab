# == Schema Information
#
# Table name: doctor_plannings
#
#  id         :bigint           not null, primary key
#  service_id :bigint
#  doctor_id  :bigint
#  patient_id :bigint
#  reason     :string
#  day        :datetime
#  start_hour :time
#  end_hour   :time
#  status     :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DoctorPlanning < ApplicationRecord
  belongs_to :service
  belongs_to :doctor, :foreign_key => "doctor_id", :class_name => "User"
  belongs_to :patient
  belongs_to :user
end
