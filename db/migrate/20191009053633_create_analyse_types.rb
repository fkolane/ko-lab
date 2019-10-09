class CreateAnalyseTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :analyse_types do |t|
      t.string :name
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
