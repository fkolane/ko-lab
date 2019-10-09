# == Schema Information
#
# Table name: insurance_prestations
#
#  id            :bigint           not null, primary key
#  insurance_id  :bigint
#  prestation_id :bigint
#  percentage    :float
#  status        :string
#  user_id       :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class InsurancePrestation < ApplicationRecord
  belongs_to :insurance
  belongs_to :prestation
  belongs_to :user
end
