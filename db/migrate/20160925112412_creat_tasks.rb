class CreatTasks < ActiveRecord::Migration
  def change
    create_table  :tasks do |t|
      t.references  :list
      t.string  :description, null: false
      t.string  :priority
      t.date    :due_date

      t.timestamps(null: false)
    end
  end
end
