# == Schema Information
#
# Table name: guard_lists
#
#  id         :bigint           not null, primary key
#  service_id :bigint
#  doctor_id  :bigint           not null
#  guard_date :datetime
#  start_hour :time
#  end_hour   :time
#  status     :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GuardList < ApplicationRecord
  belongs_to :service
  belongs_to :doctor, :foreign_key => "doctor_id", :class_name => "User"
  belongs_to :user
end
