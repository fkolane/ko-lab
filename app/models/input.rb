# == Schema Information
#
# Table name: inputs
#
#  id               :bigint           not null, primary key
#  input_type_id    :bigint
#  name             :string
#  manufacture_date :date
#  expiration_date  :date
#  batch_number     :string
#  cip              :string
#  manufacturer     :string
#  alert_level      :integer
#  shelf_number     :string
#  current_stock    :integer
#  status           :string
#  provider_id      :bigint
#  user_id          :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Input < ApplicationRecord
  before_save :default

  belongs_to :input_type
  belongs_to :user


  validates :name, presence: true, uniqueness: true
  validates :alert_level,  numericality: { only_integer: true }
  #validates :current_stock,  numericality: { only_integer: true}

  def default
    # Set default current stock
    unless self.current_stock
      self.current_stock = 0
    end

    unless self.alert_level
      self.alert_level = 0
    end
  end

end
