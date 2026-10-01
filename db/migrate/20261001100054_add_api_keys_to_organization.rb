class AddApiKeysToOrganization < ActiveRecord::Migration[8.1]
  def change
    add_column :organizations, :api_key, :string

    add_index :organizations, :api_key, unique: true
  end
end
