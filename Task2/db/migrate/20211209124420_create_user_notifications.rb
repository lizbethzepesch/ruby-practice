class CreateUserNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :user_notifications do |t|
      t.text :body
      t.boolean :status
      t.references :coach, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
