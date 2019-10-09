# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  name       :string
#  slogan     :string
#  director   :string
#  address    :string
#  phone      :string
#  po_box     :string
#  city       :string
#  country    :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organization < ApplicationRecord

    # For active storage
  has_one_attached :logo

end
