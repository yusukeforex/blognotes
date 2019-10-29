class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :email_confirmation
      t.string :password
      t.string :password_confirmation
      t.timestamps
    end
  end
end

#just add t.string :password_digest