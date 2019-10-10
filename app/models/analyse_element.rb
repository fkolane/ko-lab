# == Schema Information
#
# Table name: analyse_elements
#
#  id           :bigint           not null, primary key
#  analysis_id  :bigint
#  name         :string
#  normal_value :string
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class AnalyseElement < ApplicationRecord
  belongs_to :analysis
end
