# == Schema Information
#
# Table name: imputations
#
#  id              :bigint           not null, primary key
#  arrival_mail_id :bigint
#  service_id      :bigint
#  agent_id        :bigint
#  reason          :text
#  opinion         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Imputation < ApplicationRecord
  belongs_to :arrival_mail
  belongs_to :service
  belongs_to :agent, :foreign_key => "agent_id", :class_name => "User"
end
