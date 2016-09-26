class CreateTasks < ActiveRecord::Migration
  def change
    create_table  :tasks do |t|
      t.text        :description, null: false
      t.string      :status, default: false
      t.references  :list

      t.timestamps(null: false)
    end
  end
end
