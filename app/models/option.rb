# == Schema Information
#
# Table name: options
#
#  id              :bigint           not null, primary key
#  ticket_validity :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Option < ApplicationRecord
end
