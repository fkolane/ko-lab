class CreateEthnicGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :ethnic_groups do |t|
      t.string :name
      t.text :description
      t.string :status
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
