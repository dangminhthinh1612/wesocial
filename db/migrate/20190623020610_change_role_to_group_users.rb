class ChangeRoleToGroupUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :group_users, :role, 0
  end
end
