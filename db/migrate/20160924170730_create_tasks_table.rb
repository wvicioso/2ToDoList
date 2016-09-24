class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.boolean :status, default: false

      t.timestamps(null: false)
    end
  end
end
