class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :group_name
      t.string :group_update
      t.string :group_icon
      t.string :group_description
      t.references :user
      t.timestamps null: false
    end
  end
end
