# == Schema Information
#
# Table name: hospital_lists
#
#  id         :bigint           not null, primary key
#  name       :string
#  address    :string
#  city       :string
#  country    :string
#  phone      :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HospitalList < ApplicationRecord
end
