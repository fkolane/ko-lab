# == Schema Information
#
# Table name: insurance_types
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class InsuranceType < ApplicationRecord

   # Include shared utils.
   include SharedUtils::Model

   # Before
   before_save :before_save_hook
   
  belongs_to :user
  has_many :insurances, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true

end
