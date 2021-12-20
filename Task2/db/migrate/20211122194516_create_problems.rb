class CreateProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :problems do |t|
      t.string :name

      t.timestamps
    end

    create_table :problems_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :problem

    end

    create_table :coaches_problems, id: false do |t|
      t.belongs_to :coach
      t.belongs_to :problem
    end

    create_table :problems_techniques, id: false do |t|
      t.belongs_to :technique
      t.belongs_to :problem
    end

  end
end
