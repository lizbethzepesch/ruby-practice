class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.belongs_to :user
      t.belongs_to :technique
      t.integer :like
      t.integer :dislike

      t.timestamps
    end
  end
end
