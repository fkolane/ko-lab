# == Schema Information
#
# Table name: results
#
#  id         :bigint           not null, primary key
#  receipt_id :bigint
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Result < ApplicationRecord
  #belongs_to :analysis
  #belongs_to :sample_type
  #belongs_to :analyse_element

  has_many :result_items, dependent: :destroy


  accepts_nested_attributes_for :result_items, :allow_destroy => true
end
