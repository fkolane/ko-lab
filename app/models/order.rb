# == Schema Information
#
# Table name: orders
#
#  id                   :bigint           not null, primary key
#  medicament_family_id :bigint
#  medicament_id        :bigint
#  unit_price           :float
#  quantity             :integer
#  vat                  :float
#  total_amount         :float
#  delivery_time        :datetime
#  provider_id          :bigint
#  status               :string
#  user_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :medicament_family
  belongs_to :medicament
  belongs_to :provider
  belongs_to :user
end
