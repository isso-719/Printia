class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :mail
      t.string :password_digest
      t.string :username
      t.string :user_icon
      t.timestamps null: false
    end
  end
end
