class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :e_id
      t.string :title
      t.text :description
      t.string :lon
      t.string :lat
      t.datetime :time
      t.string :url
      t.string :group
      t.string :photo
      t.integer :fee
      t.string :address

      t.timestamps
    end
    add_index :events, :e_id
  end
end
