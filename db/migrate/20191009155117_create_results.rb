class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :receipt, foreign_key: true
      t.references :user, foreign_key: true

      t.text :comment
      t.timestamps  
    end
  end
end
