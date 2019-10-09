# == Schema Information
#
# Table name: analyses
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :float
#  status     :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Analysis < ApplicationRecord
  
  belongs_to :user

  has_many :analyse_elements


  # Validations
  validates :name, presence: true, uniqueness: true
  # Nested fields
  accepts_nested_attributes_for :analyse_elements

end
