class CreateLocalities < ActiveRecord::Migration[5.2]
  def change
    create_table :localities do |t|
      t.string :region
      t.string :cercle
      t.string :commune
      t.string :village
      t.string :neighbourhood
      t.string :status
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
