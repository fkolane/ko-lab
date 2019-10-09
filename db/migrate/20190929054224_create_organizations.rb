class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :slogan
      t.string :director
      t.string :address
      t.string :phone
      t.string :po_box
      t.string :city
      t.string :country
      t.string :email

      t.timestamps
    end
  end
end
