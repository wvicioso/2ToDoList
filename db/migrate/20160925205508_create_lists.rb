class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string      :title, null: false
      t.references  :user

      t.timestamps(null: false)
    end
  end
end
