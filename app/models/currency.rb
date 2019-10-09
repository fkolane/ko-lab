# == Schema Information
#
# Table name: currencies
#
#  id         :bigint           not null, primary key
#  symbol     :string
#  iso_code   :string
#  user_id    :bigint
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Currency < ApplicationRecord
  belongs_to :user
end
