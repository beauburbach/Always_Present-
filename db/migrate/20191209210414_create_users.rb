class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :phone_number
      t.string :student_id
      t.string :password_digest

      t.timestamps
    end
  end
end
