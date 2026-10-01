class ReplaceUserIdWithExternalCreatedByIdOnIncidents < ActiveRecord::Migration[8.1]
  def change
    remove_reference :incidents, :user, foreign_key: true

    add_column :incidents, :external_created_by_id, :string, null: false

    add_index :incidents, :external_created_by_id
  end
end