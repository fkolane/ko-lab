# == Schema Information
#
# Table name: complementary_exams
#
#  id            :bigint           not null, primary key
#  patient_id    :bigint
#  service_id    :bigint
#  doctor_id     :bigint           not null
#  prestation_id :bigint
#  total_amount  :float
#  status        :string
#  user_id       :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ComplementaryExam < ApplicationRecord
  belongs_to :patient
  belongs_to :service
  #belongs_to :prestation_type
  belongs_to :prestation
  belongs_to :user

  belongs_to :doctor, :foreign_key => "doctor_id", :class_name => "User"

end
