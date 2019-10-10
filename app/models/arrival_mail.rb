# == Schema Information
#
# Table name: arrival_mails
#
#  id             :bigint           not null, primary key
#  arrival_date   :datetime
#  origin         :string
#  reference      :string
#  mail_date      :datetime
#  recipient      :string
#  nature         :string
#  object         :string
#  reserved_suite :string
#  status         :string
#  user_id        :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ArrivalMail < ApplicationRecord
  belongs_to :user
  
  has_many :imputations

  # Nested fields
  accepts_nested_attributes_for :imputations
end
