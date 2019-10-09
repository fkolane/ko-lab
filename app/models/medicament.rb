# == Schema Information
#
# Table name: medicaments
#
#  id                    :bigint           not null, primary key
#  medicament_family_id  :bigint
#  name                  :string
#  description           :text
#  dosage                :string
#  presentation          :text
#  pharmaceutical_form   :text
#  administration_method :text
#  unit_price            :float            default(0.0)
#  vat                   :float            default(0.0)
#  total_price           :float
#  manufacture_date      :date
#  expiration_date       :date
#  batch_number          :string
#  cip                   :string
#  manufacturer          :string
#  alert_level           :integer
#  shelf_number          :string
#  current_stock         :integer
#  status                :string
#  provider_id           :bigint
#  user_id               :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Medicament < ApplicationRecord
   # Include shared utils.
   include SharedUtils::Model

   # Before
   before_save :before_save_hook
   before_save :default
   
  belongs_to :medicament_family
  belongs_to :user

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :alert_level,  numericality: { only_integer: true }
  validates :current_stock,  numericality: { only_integer: true}

  private

  def default
    # Set default current stock
    unless self.current_stock
      self.current_stock = 0
    end
  end


end
