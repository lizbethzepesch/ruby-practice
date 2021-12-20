class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.belongs_to :user
      t.belongs_to :coach
      t.boolean :status

      t.timestamps
    end
  end
end
