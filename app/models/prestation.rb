# == Schema Information
#
# Table name: prestations
#
#  id                 :bigint           not null, primary key
#  prestation_type_id :bigint
#  name               :string
#  price              :string
#  description        :text
#  status             :string
#  user_id            :bigint
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Prestation < ApplicationRecord
  belongs_to :user
  belongs_to :prestation_type
  has_many :insurance_prestations, dependent: :destroy
  has_many :insurance_medicaments, dependent: :destroy
end
