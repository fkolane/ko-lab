# == Schema Information
#
# Table name: services
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Service < ApplicationRecord
   


    # Validations
    validates :name, presence: true, uniqueness: true
  


end
