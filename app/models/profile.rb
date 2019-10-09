# == Schema Information
#
# Table name: profiles
#
#  id            :bigint           not null, primary key
#  first_name    :string
#  last_name     :string
#  gender        :string
#  phone         :string
#  specialty_one :string
#  user_id       :bigint
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Profile < ApplicationRecord
  #belongs_to :service
  
  belongs_to :user

  # For active storage
  has_one_attached :avatar
  
  def format_names
    "#{first_name} #{last_name}"
  end
end
