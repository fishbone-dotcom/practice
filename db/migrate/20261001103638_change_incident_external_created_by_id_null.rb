class ChangeIncidentExternalCreatedByIdNull < ActiveRecord::Migration[8.1]
  def change
    change_column_null :incidents, :external_created_by_id, true
  end
end
