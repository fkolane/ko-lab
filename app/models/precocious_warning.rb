# == Schema Information
#
# Table name: precocious_warnings
#
#  id             :bigint           not null, primary key
#  disease        :string
#  confirmed_case :integer
#  locality_id    :bigint
#  doctor_id      :bigint
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class PrecociousWarning < ApplicationRecord
  belongs_to :locality
end
