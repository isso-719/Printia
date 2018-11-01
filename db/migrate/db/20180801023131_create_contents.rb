class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :img
      t.string :img_description
      t.string :img_random
      t.references :user
      t.references :group
      t.timestamps null: false
    end
  end
end