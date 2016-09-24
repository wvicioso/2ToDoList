class CreateTodoListsTable < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :name, null: false
      t.references :user

      t.timestamps(null: false)
    end
  end
end
