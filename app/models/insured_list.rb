# == Schema Information
#
# Table name: insured_lists
#
#  id                  :bigint           not null, primary key
#  identifier          :string
#  first_name          :string
#  last_name           :string
#  sex                 :string
#  born_date           :date
#  born_placestar_date :datetime
#  end_date            :datetime
#  status              :string
#  user_id             :bigint
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class InsuredList < ApplicationRecord
  belongs_to :user
end
