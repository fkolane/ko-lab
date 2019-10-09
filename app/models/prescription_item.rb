# == Schema Information
#
# Table name: prescription_items
#
#  id              :bigint           not null, primary key
#  prescription_id :bigint
#  quantity        :string
#  dosage          :string
#  medicament_id   :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class PrescriptionItem < ApplicationRecord
  belongs_to :prescription
  belongs_to :medicament
end
