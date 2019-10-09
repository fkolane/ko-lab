# == Schema Information
#
# Table name: providers
#
#  id           :bigint           not null, primary key
#  company      :string
#  contact_name :string
#  address      :string
#  phone        :string
#  city         :string
#  country      :string
#  email        :string
#  status       :string
#  user_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Provider < ApplicationRecord
  belongs_to :user

  # Validations
  validates :company, presence: true,  uniqueness: true
  #validates :contact_name, presence: true, uniqueness: true
  
  
end
