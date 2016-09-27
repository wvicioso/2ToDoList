class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.integer :list_id, null: false
      t.integer :user_id, null: false
      t.boolean :marked_as_complete, null: false 

      t.timestamps
    end
  end
end
