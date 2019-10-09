class Result < ApplicationRecord
  belongs_to :analysis
  belongs_to :sample_type
  belongs_to :analyse_element
end
