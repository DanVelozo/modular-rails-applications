class CreateSamuraiContacts < ActiveRecord::Migration
  def change
    create_table :samurai_contacts_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :email
      t.string :phone
      t.references :samurai_users, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
