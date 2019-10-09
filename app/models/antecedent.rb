# == Schema Information
#
# Table name: antecedents
#
#  id                   :bigint           not null, primary key
#  patient_id           :bigint
#  medical_record_id    :bigint
#  antecedent_type      :string
#  antecedent_family_id :bigint
#  name                 :string
#  description          :text
#  status               :string
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Antecedent < ApplicationRecord
  belongs_to :patient
  belongs_to :medical_record
  belongs_to :antecedent_family
  belongs_to :user
end
