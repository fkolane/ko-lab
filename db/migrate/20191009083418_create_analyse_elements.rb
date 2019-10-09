class CreateAnalyseElements < ActiveRecord::Migration[5.2]
  def change
    create_table :analyse_elements do |t|
      t.references :analysis, foreign_key: true
      t.string :name
      t.string :normal_value
      t.string :status

      t.timestamps
    end
  end
end
