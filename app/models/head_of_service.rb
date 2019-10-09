# == Schema Information
#
# Table name: head_of_services
#
#  id         :bigint           not null, primary key
#  service_id :bigint
#  profile_id :bigint
#  user_id    :bigint
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HeadOfService < ApplicationRecord
  belongs_to :service
  belongs_to :profile
  belongs_to :user
end
