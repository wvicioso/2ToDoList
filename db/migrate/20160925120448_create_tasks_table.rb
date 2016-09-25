class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :status, default: false
      t.references :list

      t.timestamps(null: false)
    end
  end
end
