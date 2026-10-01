class AddExternalIdToIncident < ActiveRecord::Migration[8.1]
  def change
    add_column :incidents, :external_id, :string, null: false
    add_index :incidents, :external_id, unique: true
  end
end
