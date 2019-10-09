class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :identifier
      t.string :first_name
      t.string :last_name
      t.datetime :birth_date
      t.string :gender
      t.references :ethnic_group, foreign_key: true
      t.string :born_place
      t.string :profession
      t.string :tutor
      t.references :locality, foreign_key: true
      #t.string :neighbourhood
      t.string :address
      t.string :phone
      t.string :father_first_name 
      t.string :mother_first_name 
      t.string :mother_last_name
      t.string :insured
      t.string :dependent
      t.string :dependent_person_name 
      t.bigint :insurance_id #, foreign_key: true
      t.datetime :insurance_start_date 
      t.datetime :insurance_end_date 


      t.string :insurance_identifier
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
