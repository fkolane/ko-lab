# == Schema Information
#
# Table name: physical_exams
#
#  id              :bigint           not null, primary key
#  inspection      :string
#  palpation       :string
#  percussion      :string
#  auscultation    :string
#  consultation_id :bigint
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class PhysicalExam < ApplicationRecord
  belongs_to :consultation
end
