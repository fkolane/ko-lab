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

require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
