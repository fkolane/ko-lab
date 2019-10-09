# == Schema Information
#
# Table name: general_exams
#
#  id                :bigint           not null, primary key
#  obesity           :boolean
#  emaciation        :boolean
#  cachexy           :boolean
#  autonomy          :boolean
#  pallor            :boolean
#  icterus           :boolean
#  omi               :boolean
#  others            :text
#  temperature       :integer
#  weight            :float
#  height            :float
#  cranial_perimeter :float
#  blood_pressure    :integer
#  body_mass_index   :float
#  pulse             :integer
#  respiratory_rate  :float
#  consultation_id   :bigint
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class GeneralExam < ApplicationRecord
  belongs_to :consultation
  #belongs_to :user
end
