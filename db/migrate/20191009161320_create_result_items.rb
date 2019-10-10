class CreateResultItems < ActiveRecord::Migration[5.2]
  def change
    create_table :result_items do |t|
      t.references :result, foreign_key: true
      t.references :analysis, foreign_key: true
      #t.references :sample_type, foreign_key: true
      t.references :analyse_element, foreign_key: true
      t.string :normal_value
      t.string :result_value
      t.text :comment

      t.timestamps
    end
  end
end
