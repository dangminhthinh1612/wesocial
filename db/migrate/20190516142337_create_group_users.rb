class CreateGroupUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_users do |t|
      t.references :user
      t.references :group
      t.integer :role

      t.timestamps
    end
  end
end
