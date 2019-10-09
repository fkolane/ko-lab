# == Schema Information
#
# Table name: insurance_medicaments
#
#  id            :bigint           not null, primary key
#  insurance_id  :bigint
#  medicament_id :bigint
#  percentage    :float
#  status        :string
#  user_id       :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class InsuranceMedicament < ApplicationRecord
  belongs_to :insurance
  belongs_to :medicament
  belongs_to :user
end
