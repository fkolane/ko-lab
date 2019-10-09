# == Schema Information
#
# Table name: receipts
#
#  id               :bigint           not null, primary key
#  patient_id       :bigint
#  analysis_id      :bigint
#  amount           :float            default(0.0)
#  insurance_amount :float            default(0.0)
#  total_amount     :float            default(0.0)
#  status           :string
#  user_id          :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Receipt < ApplicationRecord
  belongs_to :patient
  belongs_to :user
  has_many :waiting_lists, dependent: :destroy

    has_many :receipt_items, dependent: :destroy
    # Nested fields
    accepts_nested_attributes_for :receipt_items
end
