# == Schema Information
#
# Table name: diagnostic_hypotheses
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :string
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class DiagnosticHypothesis < ApplicationRecord
  belongs_to :user
end
