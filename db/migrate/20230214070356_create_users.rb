class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.integer :mobile
      t.date :dob
      t.string :email
      t.string :encrypted_password
      t.timestamps
    end
  end
end
