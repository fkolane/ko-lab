class CreateSamples < ActiveRecord::Migration[5.2]
  def change
    create_table :samples do |t|
      t.references :patient, foreign_key: true
      t.references :sample_type, foreign_key: true
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
