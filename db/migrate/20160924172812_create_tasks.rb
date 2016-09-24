class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :list_id, null: false
      t.string :task_description, null: false
      t.boolean :marked_as_complete, null: false
    end
  end
end
