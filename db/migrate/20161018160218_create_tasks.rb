class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.references :list
      t.boolean :status, default: false

      t.timestamp(null: false)
    end
  end
end
