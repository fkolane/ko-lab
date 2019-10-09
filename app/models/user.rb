# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  login                  :string
#  role_id                :bigint
#  service_id             :bigint
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_one :profile, dependent: :destroy
  has_one :service, dependent: :destroy

  has_many :rooms, dependent: :destroy
  has_many :medicament_families, dependent: :destroy
  has_many :medicaments, dependent: :destroy
  has_many :payment_methods, dependent: :destroy
  has_many :antecedent_families, dependent: :destroy
  has_many :medicaments, dependent: :destroy
  has_many :payment_methods, dependent: :destroy
  #has_many :antecedent_families, dependent: :destroy
  #has_many :insurance_types, dependent: :destroy
  has_many :insurances, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :agent_imputations, :class_name => "Imputation", :foreign_key => :agent_id



  has_many :receipts, dependent: :destroy
  #has_many :waiting_lists, dependent: :destroy
  has_many :medical_records, dependent: :destroy
  has_many :insurance_prestations, dependent: :destroy
  has_many :insurance_medicaments, dependent: :destroy
  has_many :allergy_categories, dependent: :destroy
  has_many :allergies, dependent: :destroy
  has_many :medical_record_allergies, dependent: :destroy
  has_many :localities, dependent: :destroy
  has_many :ethnic_groups, dependent: :destroy
  has_many :medical_record_closures, dependent: :destroy
  has_many :guard_lists, dependent: :destroy
  has_many :doctor_availabilities, dependent: :destroy
  has_many :doctor_plannings, dependent: :destroy
  has_many :input_types, dependent: :destroy
  has_many :inputs, dependent: :destroy
  has_many :input_stock_entries, dependent: :destroy
  has_many :input_stock_outlets, dependent: :destroy
  has_many :providers, dependent: :destroy
  has_many :analyses, dependent: :destroy
  has_many :antecedents, dependent: :destroy
  has_many :general_exams, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :sample_types, dependent: :destroy
  has_many :samples, dependent: :destroy
  has_many :analyse_types, dependent: :destroy
  has_many :arrival_mails, dependent: :destroy


  # Nested fields
  accepts_nested_attributes_for :profile


  
end
