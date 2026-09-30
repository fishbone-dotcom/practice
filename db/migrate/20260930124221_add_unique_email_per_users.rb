class AddUniqueEmailPerUsers < ActiveRecord::Migration[8.1]
  def change
    add_index :users, [:organization_id, :email], unique: true
  end
end
