class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :due_date, null: false
      t.integer :list_id, null: false

      t.timestamps
    end
  end
end
