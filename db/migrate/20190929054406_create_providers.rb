class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :company
      t.string :contact_name
      t.string :address
      t.string :phone
      t.string :city
      t.string :country
      t.string :email
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
