class RemoveAccountInUser < ActiveRecord::Migration[6.0]
  def change
    remove_columns :users, :account
  end
end
