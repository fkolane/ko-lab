# == Schema Information
#
# Table name: social_cases
#
#  id                :bigint           not null, primary key
#  patient_id        :bigint
#  medical_record_id :bigint
#  percentage        :float
#  status            :string
#  user_id           :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class SocialCase < ApplicationRecord
  belongs_to :patient
  belongs_to :medical_record
  belongs_to :user
end
