class EnforceRequiredField < ActiveRecord::Migration[8.1]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :password, false
    change_column_null :incidents, :title, false
    change_column_null :incidents, :description, false
    change_column_null :incidents, :severity, false
    change_column_null :incidents, :status, false
  end
end
