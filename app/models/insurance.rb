# == Schema Information
#
# Table name: insurances
#
#  id          :bigint           not null, primary key
#  name        :string
#  limited     :string
#  limit_age   :bigint
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Insurance < ApplicationRecord

  # Include shared utils.
  include SharedUtils::Model

  # Before
  before_save :before_save_hook



  belongs_to :user


  # Validations
  validates :name, presence: true, uniqueness: true
  
end
