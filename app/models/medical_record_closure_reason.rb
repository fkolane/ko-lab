# == Schema Information
#
# Table name: medical_record_closure_reasons
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MedicalRecordClosureReason < ApplicationRecord
  belongs_to :user
end
