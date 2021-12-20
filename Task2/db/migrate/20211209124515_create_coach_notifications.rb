class CreateCoachNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :coach_notifications do |t|
      t.text :body
      t.boolean :status
      t.references :coach, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
