# == Schema Information
#
# Table name: examination_requests
#
#  id              :bigint           not null, primary key
#  prestation_id   :bigint
#  reason          :string
#  consultation_id :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ExaminationRequest < ApplicationRecord
  belongs_to :exam_type
  belongs_to :patient
  belongs_to :medical_record
  belongs_to :doctor
  belongs_to :user
end
