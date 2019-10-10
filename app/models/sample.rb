# == Schema Information
#
# Table name: samples
#
#  id             :bigint           not null, primary key
#  patient_id     :bigint
#  sample_type_id :bigint
#  status         :string
#  user_id        :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Sample < ApplicationRecord
  belongs_to :sample_type
  belongs_to :user
end
