# == Schema Information
#
# Table name: patients
#
#  id                    :bigint           not null, primary key
#  identifier            :string
#  first_name            :string
#  last_name             :string
#  birth_date            :datetime
#  gender                :string
#  ethnic_group_id       :bigint
#  born_place            :string
#  profession            :string
#  tutor                 :string
#  locality_id           :bigint
#  address               :string
#  phone                 :string
#  father_first_name     :string
#  mother_first_name     :string
#  mother_last_name      :string
#  insured               :string
#  dependent             :string
#  dependent_person_name :string
#  insurance_id          :bigint
#  insurance_start_date  :datetime
#  insurance_end_date    :datetime
#  insurance_identifier  :string
#  status                :string
#  user_id               :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Patient < ApplicationRecord
  before_save :generate_identifier

  #belongs_to :insurance
  belongs_to :user




  def patient_full
    "#{identifier} | #{first_name} #{last_name}"
  end

  
  private
  def generate_identifier
    day = self.birth_date.day
    month = self.birth_date.month
    born_year = self.birth_date.year.to_s
    born_year = born_year[2..3]
   
    first_name = self.first_name[0..1]#.upcase
    last_name = self.last_name[0..1]#.upcase

    father_first_name = self.father_first_name[0..1]#.upcase
    mother_first_name = self.mother_first_name[0..1]#.upcase
    mother_last_name = self.mother_last_name[0..1]#.upcase
    gender = self.gender[0]

    self.identifier = "#{born_year}#{last_name}#{month}#{first_name}#{day}-#{father_first_name}#{self.id}-#{mother_last_name}#{mother_first_name}-#{gender}".upcase
  end
end
