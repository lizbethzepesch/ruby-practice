class CreateCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :coaches do |t|
          t.string :name
          t.integer :age
          t.string :email
          t.string :password_digest
          t.integer :gender
          t.text :about
          t.text :experience
          t.text :licenses
          t.text :education

          t.timestamps
        end
  end
end
