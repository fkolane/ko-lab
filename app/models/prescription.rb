# == Schema Information
#
# Table name: prescriptions
#
#  id         :bigint           not null, primary key
#  patient_id :bigint
#  doctor_id  :bigint
#  status     :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Prescription < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :user

  has_many :prescription_items

  # Nested fields
  accepts_nested_attributes_for :prescription_items
end
