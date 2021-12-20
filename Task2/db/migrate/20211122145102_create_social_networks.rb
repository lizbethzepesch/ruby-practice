class CreateSocialNetworks < ActiveRecord::Migration[6.1]
  def change
    create_table :social_networks do |t|
      t.text :name
      t.references :coach, null: true, foreign_key: true

      t.timestamps
    end
  end
end
