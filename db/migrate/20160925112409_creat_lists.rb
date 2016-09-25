class CreatLists < ActiveRecord::Migration
  def change
    create_table  :lists do |t|
      t.references  :creator
      t.string  :name
      t.string  :status

      t.timestamps(null: false)
    end
  end
end
