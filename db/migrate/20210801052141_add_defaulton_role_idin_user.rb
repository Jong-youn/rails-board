class AddDefaultonRoleIdinUser < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :role_id, 2
  end
end
