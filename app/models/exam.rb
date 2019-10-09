# == Schema Information
#
# Table name: exams
#
#  id                    :bigint           not null, primary key
#  exam_type_id          :bigint
#  reason                :string
#  exploration_nature    :text
#  diagnostic_hypothesis :string
#  patient_id            :bigint
#  medical_record_id     :bigint
#  doctor_id             :bigint           not null
#  notes                 :text
#  status                :string
#  user_id               :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Exam < ApplicationRecord
  belongs_to :exam_type
  belongs_to :patient
  belongs_to :medical_record
  belongs_to :doctor
  belongs_to :user
end
