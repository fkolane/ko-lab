class CreateArrivalMails < ActiveRecord::Migration[5.2]
  def change
    create_table :arrival_mails do |t|
      t.datetime :arrival_date
      t.string :origin
      t.string :reference
      t.datetime :mail_date
      t.string :recipient
      t.string :nature
      t.string :object
      t.string :reserved_suite
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
