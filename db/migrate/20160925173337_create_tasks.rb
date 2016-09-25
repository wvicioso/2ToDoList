class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content, null: false
      t.integer :user_id, null: false
      t.string :status

      t.timestamps null: false
    end
  end
end
