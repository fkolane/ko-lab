# == Schema Information
#
# Table name: roles
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ApplicationRecord
    # Include shared utils.
    include SharedUtils::Model

    # Before
    before_save :before_save_hook

    has_many :users, dependent: :destroy

  # Validations
    validates :name, presence: true, uniqueness: true


end
