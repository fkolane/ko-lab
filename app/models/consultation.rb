# == Schema Information
#
# Table name: consultations
#
#  id                    :bigint           not null, primary key
#  patient_id            :bigint
#  medical_record_id     :bigint
#  reason                :string
#  exit_diagnostic       :text
#  disease_history       :text
#  decision              :string
#  exit_date             :datetime
#  diagnostic_hypothesis :text
#  summary               :text
#  syndromic_grouping    :text
#  service_id            :bigint
#  doctor_id             :bigint           not null
#  user_id               :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Consultation < ApplicationRecord
  belongs_to :patient
  belongs_to :medical_record
  belongs_to :user
  belongs_to :doctor, :foreign_key => "doctor_id", :class_name => "User"
  belongs_to :service

  has_one :general_exam
  has_one :physical_exam
  has_many :examination_requests
  has_many :treatments
  has_one :medical_antecedent
  has_one :surgical_antecedent
  has_one :obstetric_gynecologist_antecedent
  has_one :eating_habit
  has_one :family_antecedent
  has_one :risk_factor
  has_one :life_quality


  # Nested fields
  accepts_nested_attributes_for :general_exam
  accepts_nested_attributes_for :physical_exam
  accepts_nested_attributes_for :examination_requests
  accepts_nested_attributes_for :treatments
  accepts_nested_attributes_for :medical_antecedent
  accepts_nested_attributes_for :surgical_antecedent
  accepts_nested_attributes_for :obstetric_gynecologist_antecedent
  accepts_nested_attributes_for :eating_habit
  accepts_nested_attributes_for :family_antecedent
  accepts_nested_attributes_for :risk_factor
  accepts_nested_attributes_for :life_quality

  #Validations
  validates :summary, presence: true
  validates :decision, presence: true



  
end
