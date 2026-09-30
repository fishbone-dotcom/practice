class CreateIncidents < ActiveRecord::Migration[8.1]
  def change
    create_table :incidents do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :severity
      t.string :status
      t.datetime :started_at
      t.datetime :resolved_at

      t.timestamps
    end
  end
end
