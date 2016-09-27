class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.boolean :completed, default: false
      t.references :list

      t.timestamps
    end
  end
end
