class CreateAnalyses < ActiveRecord::Migration[5.2]
  def change
    create_table :analyses do |t|
      t.string :name
      t.float :price
      t.string :normal_value
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
