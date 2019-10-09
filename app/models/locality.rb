# == Schema Information
#
# Table name: localities
#
#  id            :bigint           not null, primary key
#  region        :string
#  cercle        :string
#  commune       :string
#  village       :string
#  neighbourhood :string
#  status        :string
#  user_id       :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Locality < ApplicationRecord
  belongs_to :user
end
