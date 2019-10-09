# == Schema Information
#
# Table name: sales
#
#  id                   :bigint           not null, primary key
#  patient_type         :string
#  patient_id           :string
#  medicament_family_id :bigint
#  medicament_id        :bigint
#  unit_price           :float
#  quantity             :integer
#  vat                  :float
#  total_amount         :float
#  status               :string
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Sale < ApplicationRecord
  belongs_to :medicament_family
  belongs_to :medicament
  belongs_to :user

  #Validations
  validates :quantity,  numericality: { only_integer: true , greater_than: 0}

  
end
